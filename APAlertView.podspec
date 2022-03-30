Pod::Spec.new do |s|

  s.name         = "APAlertView"
  s.version      = "2.0.0"
  s.summary      = "A powerful customizable Alert View written in Swift."
  s.description  = <<-DESC
                   APAlertView is a powerful customizable Alert View written in Swift. With APAlertView, you can easily make your desired Alert View in some lines of code.
                   DESC

  s.homepage     = "https://github.com/arvindcs/APAlertView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Arvind Patel' => 'arvindpatelcs@gmail.com' }

  s.platforms = { :ios => "13.0" }




  s.source       = { :git => "https://github.com/Arvindcs/APAlertView.git", :tag => s.version.to_s }
  s.source_files = 'APAlertView/Source/APAlertView.swift', 'APAlertView/Source/APActionSheet.swift'
  s.ios.deployment_target = "13.0"
  s.swift_version = "5.0"

end
