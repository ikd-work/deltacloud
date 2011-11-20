module ProviderSupportHelper
  def compute_support
    [
      {:name => "Amazon EC2", :driver => true, :instance => { :create => true, :start => false, :stop => true, :reboot => true, :destroy => true },
        :list => { :hardware_profiles => true, :realms => true, :images => true, :instances => true} },
      {:name => "GoGrid", :driver => true, :instance => { :create => true, :start => false, :stop => true, :reboot => true, :destroy => true },
        :list => { :hardware_profiles => true, :realms => true, :images => true, :instances => true} },
      {:name => "OpenNebula", :driver => true, :instance => { :create => true, :start => true, :stop => true, :reboot => false, :destroy => true },
        :list => { :hardware_profiles => true, :realms => true, :images => true, :instances => true} },
      {:name => "Rackspace", :driver => true, :instance => { :create => true, :start => false, :stop => true, :reboot => true, :destroy => true },
        :list => { :hardware_profiles => true, :realms => true, :images => true, :instances => true} },
      {:name => "RHEV-M", :driver => true, :instance => { :create => true, :start => true, :stop => true, :reboot => true, :destroy => true },
        :list => { :hardware_profiles => true, :realms => true, :images => true, :instances => true} },
      {:name => "RimuHosting", :driver => true, :instance => { :create => true, :start => true, :stop => true, :reboot => true, :destroy => true },
        :list => { :hardware_profiles => true, :realms => true, :images => true, :instances => true} },
      {:name => "Terremark", :driver => true, :instance => { :create => true, :start => true, :stop => true, :reboot => true, :destroy => true },
        :list => { :hardware_profiles => true, :realms => true, :images => true, :instances => true} },
      {:name => "vCloud", :driver => false, :instance => { :create => true, :start => true, :stop => true, :reboot => true, :destroy => true },
        :list => { :hardware_profiles => true, :realms => true, :images => true, :instances => true} },
    ]
  end

  def storage_support
    [
     { :name => "Amazon S3", :driver => true,
       :container => { :create => true, :update => true },
       :blob => { :create => true, :update => true, :rw => true,
         :rw_attr => true } },
     { :name => "Rackspace CloudFiles", :driver => true,
       :container => { :create => true, :update => true },
       :blob => { :create => true, :update => true, :rw => true,
         :rw_attr => true } },
     { :name => "Microsoft Azure", :driver => false,
       :container => { }, :blob => { } },
     { :name => "Google Storage", :driver => false,
       :container => { }, :blob => { } },
    ]
  end

  LABELS = { true => "yes", false => "no" }

  def support_indicator(value)
    text = LABELS[value] || "TBD"
    cls = value ? "supported" : "not-supported"
    "<td class=\"#{cls}\">#{text}</td>"
  end

end

Webby::Helpers.register(ProviderSupportHelper)
