Pod::Spec.new do |s|
  s.name     = 'AIFNetworking'
  s.version  = '1.0'
  s.summary  = 'Anjuke iOS Framework: Networking'
  s.authors  = { 'Casa Taloyum' => 'casatwy@msn.com' }
  s.source   = { :git => 'git@git.corp.anjuke.com:_iOS/AIFNetworking' }
  s.requires_arc = true
  s.ios.deployment_target = '6.0'

  s.source_files = 'RTNetworking/Components/*.{h,m}'

  s.subspec 'Assistants' do |ss|
    ss.source_files = 'RTNetworking/Components/Assistants/*.{h,m}'
  end

  s.subspec 'Categories' do |ss|
    ss.source_files = 'RTNetworking/Components/Categories/*.{h,m}'
    ss.frameworks = 'Security'
  end

  s.subspec 'Components' do |ss|
    ss.source_files = 'RTNetworking/Components/Components/*.{h,m}'
    ss.frameworks = 'SystemConfiguration'
    ss.subspec 'LocationComponents' do |sss|
        sss.source_files = 'RTNetworking/Components/Components/LocationComponents/**/*.{h,m}'
    end
    ss.subspec 'LogComponents' do |sss|
        sss.source_files = 'RTNetworking/Components/Components/LogComponents/*.{h,m}'
    end
    ss.subspec 'CacheComponents' do |sss|
        sss.source_files = 'RTNetworking/Components/Components/CacheComponents/*.{h,m}'
    end
  end

  s.subspec 'Services' do |ss|
    ss.source_files = 'RTNetworking/Components/Services/*.{h,m}'

    ss.subspec 'Anjuke' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/Anjuke/*.{h,m}'
    end
    ss.subspec 'Broker' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/Broker/*.{h,m}'
    end
    ss.subspec 'GoogleMap' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/GoogleMap/*.{h,m}'
    end
    ss.subspec 'Haozu' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/Haozu/*.{h,m}'
    end
    ss.subspec 'GoogleMap' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/GoogleMap/*.{h,m}'
    end
    ss.subspec 'Jinpu' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/Jinpu/*.{h,m}'
    end
    ss.subspec 'Other' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/Other/*.{h,m}'
    end
    ss.subspec 'X' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/X/*.{h,m}'
    end
    ss.subspec 'Xinfang' do |sss|
        sss.source_files = 'RTNetworking/Components/Services/Xinfang/*.{h,m}'
    end

  end
end
