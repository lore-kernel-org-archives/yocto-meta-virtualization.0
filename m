Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2DA7E0086F; Tue,  2 Dec 2014 20:41:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.170 listed in list.dnswl.org]
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61A66E00521
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Dec 2014 20:41:46 -0800 (PST)
Received: by mail-lb0-f170.google.com with SMTP id w7so11760437lbi.15
	for <meta-virtualization@yoctoproject.org>;
	Tue, 02 Dec 2014 20:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=i+s9FGPyb0zfv9k3IYLOUt4QgTEFiENgungvXQgIv8Y=;
	b=TPLOBqYfuT1b2EQLt5uy4GjS/91E//vrs4TkPObsmSj0wd9V7PWRgVpsYV4uo2Wy1J
	cC9qNfAKhyJALtzhX34WX6k/EvRYf7eG4UMoYn/sehlhU2X/IJti1+DaTPv21nFu6GW5
	aGng6evm1SqGl3T3mAEn+OO3KU4Xwdkoe5G3gGyS7dPxipKLRo0X0p/DfX+raniUUi35
	JAO30bTbCqQ3d1s8XaWUhz5MML39ov814sfNw/UZXeRW+EuvG+KNwR+1/2mCF75RpyZt
	txeqxvcgGO2YfUg4T9n7Yls+250Gs9bCbkh2UMe8zSogWFkzgxDWQAIDqT527JLH2JkA
	7o9w==
MIME-Version: 1.0
X-Received: by 10.112.52.37 with SMTP id q5mr2403353lbo.32.1417581705132; Tue,
	02 Dec 2014 20:41:45 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Tue, 2 Dec 2014 20:41:45 -0800 (PST)
In-Reply-To: <1417575623-10537-1-git-send-email-b40869@freescale.com>
References: <1417575623-10537-1-git-send-email-b40869@freescale.com>
Date: Tue, 2 Dec 2014 23:41:45 -0500
Message-ID: <CADkTA4ObEwqU_7Lu-npsKp9B+VK27KzjqfMcCM-9XF4aF7K=3w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: YangHaibo <b40869@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] puppet: add recipe for puppet 3.7.3
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
X-List-Received-Date: Wed, 03 Dec 2014 04:41:50 -0000
Content-Type: text/plain; charset=UTF-8

I like the functionality being proposed here.

That being said, do you have any sort of README or other instructions you can
contribute with the packages to show how they can actually be used to
deploy/configure
a target ?

Also what about adding them to one of the image types in meta-virt ?

Without that information, we have three packages, that are not built
by default or
part of the images .. hence they'll bitrot and won't get much (if any) adoption.

Bruce


On Tue, Dec 2, 2014 at 10:00 PM, YangHaibo <b40869@freescale.com> wrote:
> ---
>  .../puppet/puppet/add_puppet_gemspec.patch         | 23 ++++++++++++++++
>  .../recipes-support/puppet/puppet_3.7.3.bb         | 31 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
>  create mode 100644 meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
>
> diff --git a/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch b/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
> new file mode 100644
> index 0000000..a5c8e3b
> --- /dev/null
> +++ b/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
> @@ -0,0 +1,23 @@
> +diff -urN puppet-3.7.3_ori/puppet.gemspec puppet-3.7.3/puppet.gemspec
> +--- puppet-3.7.3_ori/puppet.gemspec    1970-01-01 08:00:00.000000000 +0800
> ++++ puppet-3.7.3/puppet.gemspec        2014-11-12 14:30:07.000000000 +0800
> +@@ -0,0 +1,19 @@
> ++$:.unshift(File.dirname(__FILE__) + '/lib')
> ++require 'puppet/version'
> ++
> ++Gem::Specification.new do |s|
> ++  s.name = 'puppet'
> ++  s.version = Puppet::PUPPETVERSION
> ++  s.platform = Gem::Platform::RUBY
> ++  s.summary = 'Open source Puppet is a configuration management system'
> ++  s.description = s.summary
> ++  s.author = 'Yang Haibo'
> ++  s.email = 'b40869@freescale.com'
> ++  s.homepage = 'https://puppetlabs.com/puppet/puppet-open-source'
> ++  s.license = 'Apache 2.0'
> ++
> ++  s.bindir       = 'bin'
> ++  s.executables  = ['puppet', 'extlookup2hiera']
> ++  s.require_path = 'lib'
> ++  s.files = %w(LICENSE README.md Rakefile) + Dir.glob('{lib,spec}/**/*')
> ++end
> diff --git a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
> new file mode 100644
> index 0000000..afd9a23
> --- /dev/null
> +++ b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Open source Puppet is a configuration management system"
> +HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f257790c70561550fd666c6e0044fd89"
> +
> +SRC_URI = " \
> +    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
> +    file://add_puppet_gemspec.patch \
> +"
> +SRC_URI[md5sum] = "cc294da1d51df07bcc7f6cf78bd90ce0"
> +SRC_URI[sha256sum] = "4a3bd7ddb51072c3dd898a8de158cde204a2d8fd0b84e8ac806b84c074348637"
> +
> +inherit ruby
> +
> +DEPENDS += " \
> +        ruby \
> +        facter \
> +        hiera \
> +"
> +
> +RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
> +
> +do_install_append() {
> +    install -d ${D}${sysconfdir}/puppet
> +    install -d ${D}${sysconfdir}/puppet/manifests
> +    install -d ${D}${sysconfdir}/puppet/modules
> +
> +    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/tagmail.conf ${D}${sysconfdir}/puppet/
> +}
> --
> 1.9.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

