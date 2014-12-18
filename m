Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1A1AE00B68; Thu, 18 Dec 2014 10:01:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82BB8E00A73
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Dec 2014 10:01:46 -0800 (PST)
Received: by mail-lb0-f179.google.com with SMTP id z11so1379903lbi.38
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Dec 2014 10:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dEiyxzUs0QylP4Uu7iudlrJ+NKxGvTer1rfHoozPXkY=;
	b=Re/qWEdKIl9yVbkxkS3cnQQ5Br78G8s0AVYyJyJwu9KHKLAnsO67wPYp0oblC8Kv50
	Wy4mBcB+I0rNe8TVhQFxDI5+p+RKbGUJZzl6DVoAjASkO3y6tYJlPCpOnuge9A5Sz2VF
	8Y7l6334qwWsCDu4WbJxmrJgldsow1Nz3HRsRlF/rLvgtAWsTUGJfhIP+waBZrwdUf93
	7w4vso2rm2B/7hm/c6rCbz50RQWIkogw2jGVrAlUBNHrvpy1oOrYSCGOcVajwEIpIQWX
	H/DFaEEZ4kXzat+ca+yBq6saH1DMhtRJ/fQohzQ1RVB+ejZwBWl2lF16+NrsEFg/Q9YA
	9vYA==
MIME-Version: 1.0
X-Received: by 10.152.87.12 with SMTP id t12mr3559502laz.31.1418925705168;
	Thu, 18 Dec 2014 10:01:45 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 18 Dec 2014 10:01:45 -0800 (PST)
In-Reply-To: <CADkTA4PcsMQ3P=oogBPxoaLFeUSsK7wxSL1VZZepKgwTfB1Jjw@mail.gmail.com>
References: <1417597676-18985-1-git-send-email-b40869@freescale.com>
	<CADkTA4PcsMQ3P=oogBPxoaLFeUSsK7wxSL1VZZepKgwTfB1Jjw@mail.gmail.com>
Date: Thu, 18 Dec 2014 13:01:45 -0500
Message-ID: <CADkTA4P0u2ns0-aCy+qL7dBK_jRYAwfgt7hVV02W=KhktFMjnA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: YangHaibo <b40869@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] puppet: add recipe for puppet 3.7.3
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Dec 2014 18:01:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 3, 2014 at 10:21 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Dec 3, 2014 at 4:07 AM, YangHaibo <b40869@freescale.com> wrote:
>> A simple demo is added
>
> Fantastic.
>
> I'll queue the patches and do a test build. With the chef support and
> now puppet, we have
> some nice functionality for configuration and deployment.

My apologies for the delay on this. I was travelling for a week and
didn't get the cycles
to to all the builds I wanted.

But I've now built and tested this. I've pushed it to the master and
juno branches.
If you need it elsewhere, let me know and I can cherry pick and push.

Bruce

>
> Cheers,
>
> Bruce
>
>> ---
>>  meta-openstack/recipes-support/puppet/README       | 75 ++++++++++++++++++++++
>>  .../puppet/puppet/add_puppet_gemspec.patch         | 23 +++++++
>>  .../recipes-support/puppet/puppet_3.7.3.bb         | 31 +++++++++
>>  3 files changed, 129 insertions(+)
>>  create mode 100644 meta-openstack/recipes-support/puppet/README
>>  create mode 100644 meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
>>  create mode 100644 meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
>>
>> diff --git a/meta-openstack/recipes-support/puppet/README b/meta-openstack/recipes-support/puppet/README
>> new file mode 100644
>> index 0000000..2de808a
>> --- /dev/null
>> +++ b/meta-openstack/recipes-support/puppet/README
>> @@ -0,0 +1,75 @@
>> +What is Puppet
>> +------------------------
>> +Puppet is a configuration management system that allows you to define the
>> +state of your IT infrastructure, then automatically enforces the correct state.
>> +
>> +
>> +Basic Requirements
>> +------------------------
>> +Ruby 1.8.7 or later
>> +Facter 1.7.0 or later
>> +Hiera 1.0 or later
>> +The json gem (any modern version)
>> +
>> +
>> +Simple Demo
>> +------------------------
>> +In this simple demo, we have a CA master server named 'master' and ip is 192.168.2.83
>> +and an agent node named 'agent', ip is 192.168.2.30.
>> +
>> +On master server, file 'test.cfg' is under /etc/puppet/files/, puppet will sync this
>> +file to /opt/ folder on agent node.
>> +
>> +Step 1: Configure Puppet CA Master Server
>> +1) create a puppet group and user
>> +$ puppet resource group puppet ensure=presnt
>> +$ puppet resource user puppet ensure=present gid=puppet shell='/sbin/nologin'
>> +
>> +2) create the CA certificate and the puppet master certificate
>> +$ puppet master --verbose --no-daemonize
>> +(Once it says Notice: Starting Puppet master version <VERSION>, type ctrl-C to kill the process)
>> +
>> +3) $ vi /etc/hosts
>> +add new line:
>> +192.168.2.30    agent
>> +
>> +4) start puppet master
>> +$ puppet master --verbose --no-daemonize &
>> +
>> +
>> +Step 2: Config Puppet Agent Node
>> +1) Edit puppet.conf
>> +$ echo "[main]
>> +server = master" >> /etc/puppet/puppet.conf
>> +
>> +2) $ vi /etc/hosts
>> +add new line:
>> +192.168.2.83    master
>> +
>> +3) Request certificates
>> +$ puppet agent --test --ca_server=t2080qds -w 60
>> +(Accept the request on master server by this command: puppet cert sign --all)
>> +
>> +
>> +Step 3: Add site map on master
>> +1) Edit /etc/puppet/fileserver.conf to make /etc/puppet/files available
>> +$ mkdir /etc/puppet/files
>> +$ touch /etc/puppet/files/test.cfg
>> +$ vi /etc/puppet/fileserver.conf
>> +add following lines:
>> +[extra_files]
>> +   path /etc/puppet/files
>> +   allow *
>> +
>> +2) Add a new sitemap
>> +$ vi /etc/puppet/manifests/site.pp
>> +add follwing lines:
>> +file
>> +{ "/opt/test.cfg":
>> +source => "puppet:///extra_files/test.cfg",
>> +}
>> +
>> +
>> +Step 4: Run puppet on agent
>> +$ puppet agent --test
>> +$ ls /opt/
>> diff --git a/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch b/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
>> new file mode 100644
>> index 0000000..a5c8e3b
>> --- /dev/null
>> +++ b/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
>> @@ -0,0 +1,23 @@
>> +diff -urN puppet-3.7.3_ori/puppet.gemspec puppet-3.7.3/puppet.gemspec
>> +--- puppet-3.7.3_ori/puppet.gemspec    1970-01-01 08:00:00.000000000 +0800
>> ++++ puppet-3.7.3/puppet.gemspec        2014-11-12 14:30:07.000000000 +0800
>> +@@ -0,0 +1,19 @@
>> ++$:.unshift(File.dirname(__FILE__) + '/lib')
>> ++require 'puppet/version'
>> ++
>> ++Gem::Specification.new do |s|
>> ++  s.name = 'puppet'
>> ++  s.version = Puppet::PUPPETVERSION
>> ++  s.platform = Gem::Platform::RUBY
>> ++  s.summary = 'Open source Puppet is a configuration management system'
>> ++  s.description = s.summary
>> ++  s.author = 'Yang Haibo'
>> ++  s.email = 'b40869@freescale.com'
>> ++  s.homepage = 'https://puppetlabs.com/puppet/puppet-open-source'
>> ++  s.license = 'Apache 2.0'
>> ++
>> ++  s.bindir       = 'bin'
>> ++  s.executables  = ['puppet', 'extlookup2hiera']
>> ++  s.require_path = 'lib'
>> ++  s.files = %w(LICENSE README.md Rakefile) + Dir.glob('{lib,spec}/**/*')
>> ++end
>> diff --git a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
>> new file mode 100644
>> index 0000000..afd9a23
>> --- /dev/null
>> +++ b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
>> @@ -0,0 +1,31 @@
>> +SUMMARY = "Open source Puppet is a configuration management system"
>> +HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f257790c70561550fd666c6e0044fd89"
>> +
>> +SRC_URI = " \
>> +    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
>> +    file://add_puppet_gemspec.patch \
>> +"
>> +SRC_URI[md5sum] = "cc294da1d51df07bcc7f6cf78bd90ce0"
>> +SRC_URI[sha256sum] = "4a3bd7ddb51072c3dd898a8de158cde204a2d8fd0b84e8ac806b84c074348637"
>> +
>> +inherit ruby
>> +
>> +DEPENDS += " \
>> +        ruby \
>> +        facter \
>> +        hiera \
>> +"
>> +
>> +RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
>> +
>> +do_install_append() {
>> +    install -d ${D}${sysconfdir}/puppet
>> +    install -d ${D}${sysconfdir}/puppet/manifests
>> +    install -d ${D}${sysconfdir}/puppet/modules
>> +
>> +    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
>> +    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
>> +    install -m 655 ${S}/conf/tagmail.conf ${D}${sysconfdir}/puppet/
>> +}
>> --
>> 1.9.2
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

