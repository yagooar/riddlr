module SolutionHelper
  def really_convert_to_ms(seconds)
    value = (seconds*1000).ceil

    value == 0 ? 1 : value
  end

  def convert_to_ms(seconds)
    value = (seconds*1000).ceil

    value == 0 ? 'too fast to measure!' : value
  end

  def display_author(obj)
    obj.author.presence || na_na_cache(obj)
  end

end
