module NavigationHelpers

  def path_to(page_name)
    case page_name

      when /the home\s?page/
        '/'
      when /the dashboard\s?page/
        authenticated_root_path
      when /the page for "([^"]*)"/
        page_path(Page.find_by_title($1) || Page.find_by_url_slug($1))

      else
        begin
          page_name =~ /the (.*) page/
          path_components = $1.split(/\s+/)
          self.send(path_components.push('path').join('_').to_sym)
        rescue Object => e
          raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                  "Now, go and add a mapping in #{__FILE__}\n" +
                  "Fyi, your current url is: #{current_url}"
        end
    end
  end
end

World(NavigationHelpers)