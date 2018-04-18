class ImagePresenter
  def self.images(park)
    if park.nil?
      Image.all.sample(20)
    else
      Image.where("park ILIKE ?", "%#{park}%")
    end
  end
end
