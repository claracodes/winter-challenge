class GenerateEmotionsService
  def self.call(*args)
    new(*args).call
  end

  def initialize(photo)
    @photo = photo
  end

  def call
    url = @photo.url(crop: :thumb,
                    gravity: :face,
                    height: 64,
                    width: 64,
                    effect: :grayscale)

    image = MiniMagick::Image.open(url)
    img = prepare_image(image)
    pixels = create_matrix(img)
    result = run_predictions(pixels)
    probabilities = softmax(result["Plus692_Output_0"].first)
    create_readable_hash(probabilities)
  end

  def prepare_image(img)
    img.resize "64x64^", "-gravity", "center", "-extent", "64x64"
    img.colorspace "Gray"
    img
  end

  def create_matrix(img)
    pixels = img.get_pixels.flat_map { |r| r.map(&:first) }
    OnnxRuntime::Utils.reshape(pixels, [1, 1, 64, 64])
  end

  def run_predictions(pixels)
    model = OnnxRuntime::Model.new(File.open(Rails.root + "spec/fixtures/model.onnx"))
    model.predict("Input3" => pixels)
  end

  def create_readable_hash(probabilities)
    emotion_labels = [
      "neutral", "happiness", "surprise", "sadness",
      "anger", "disgust", "fear", "contempt"
    ]
    emotion_labels.zip(probabilities).sort_by { |_, v| -v.round(5) }.to_h
  end

  def softmax(x)
    exp = x.map { |v| Math.exp(v - x.max) }
    exp.map { |v| v / exp.sum }
  end
end

