Pod::Spec.new do |spec|
  spec.name         = 'iOSUrlRoute'
  spec.version      = '1.0'
  spec.ios.deployment_target = '7.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/campusappcn/iOSUrlRoute.git'
  spec.authors      = { 'YYDD' => '615689375@qq.com' }
  spec.summary      = 'HeLian iOS Tools'
  spec.source       = { :git => 'https://github.com/campusappcn/iOSUrlRoute.git'}
  spec.source_files = 'UrlRoute/*.{h,m}'

  spec.subspec 'SDCUrlRoute' do |s|
    s.source_files = 'UrlRoute/*.{h,m}'
    s.public_header_files = 'UrlRoute/*.h'

    s.subspec 'Base' do |ss|
      ss.source_files = 'UrlRoute/Base/*.{h,m}'
      ss.public_header_files = 'UrlRoute/Base/*.h'
    end

    s.subspec 'Ext' do |ss|
      ss.source_files = 'UrlRoute/Ext/*.{h,m}'
      ss.public_header_files = 'UrlRoute/Ext/*.h'
    end

  end

end
