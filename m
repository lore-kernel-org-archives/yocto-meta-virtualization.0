Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4A3CE00510; Sun, 25 Dec 2016 10:12:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06BE5E004D2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:12:15 -0800 (PST)
Received: by mail-yb0-f178.google.com with SMTP id l23so10491638ybj.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GIt5Nv9gwvG/oaYSm51u47Q3L0Rd1t0lOa6fUjeAT+I=;
	b=J4v0LM7AXSXS8VCaxS4SAElBIKrY6L1DZRDRz9SNpS/+4HHmsk786to5CYCN9uqYin
	deAug9xa2cy/SWNw9kn1abJDhRsUOpsIG6EvVdL1eNQFzhJyVJZBVCHMj5nvH39VSrbm
	NH2IPCyQ0nj/bEO/yIJHAhErkjodaYpfl5DjHQHVJJ7hoTJ32rb7kyRmzKf14Q/Vr16P
	6duKAE6APnmWcTMJ+vrWxXSRfocU1GoGaISZyNmhhHBGfLS7//Z2rLklTszkAbRhjiqw
	hNTh+pHdBvTvpaA3F9Tw1FlU9T6G5Kz0xGNE4KUQsOEuW8DpzMIevRALbqulRTXqBetl
	3tFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=GIt5Nv9gwvG/oaYSm51u47Q3L0Rd1t0lOa6fUjeAT+I=;
	b=JaEI7tHBPHSAVbr7YEaj1cfX4SD4F5/xo3KCKHgeSJpcbxB1MVUM/GYLIl8oHoMJKY
	KEUnXIaE4Wsf17V2xnk9oMGHVysHpKos24zOMOq95ypMw+1qne+82joBlHrCR0PHf1yM
	nL4nvBk7m3n4hLYaFX2J3FeTLRiUCfKUPd3IptIF2+tCqFVCJNZC7SiK3q2rhSpiBXS7
	RHbk9XvVGX1xaBd/8BtoFbKsrv5TcBJelfZHAW55KyERPah36eE0E0EFBfNvpi5wTxmd
	d1nq4GTW5YfOysdAsaSYGdovVjw87iz9kMprBh4Ep/Y+lY+ZCmYighuZ3bU8DaBLuFTp
	5tYQ==
X-Gm-Message-State: AIkVDXLa/ojA0fO8LiLr3ObwHhdpmFD10Jent6MfYSoXPi5Mg7H98MnDB07yHqHeILr7n4EZ33AlqP0w+TO8Mg==
X-Received: by 10.37.203.215 with SMTP id b206mr17213203ybg.110.1482689534793; 
	Sun, 25 Dec 2016 10:12:14 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Sun, 25 Dec 2016 10:12:14 -0800 (PST)
In-Reply-To: <1416973638-18967-1-git-send-email-b40869@freescale.com>
References: <1416973638-18967-1-git-send-email-b40869@freescale.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sun, 25 Dec 2016 13:12:14 -0500
X-Google-Sender-Auth: 15jNJc1SXV6cUS6MJx6kE6WtFQo
Message-ID: <CAPuovEKaeWuG7iac4uEYfUzYoZUtL-DgJf8ztOcM0YDQiM7bpA@mail.gmail.com>
To: YangHaibo <b40869@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] puppet: add recipe for puppet 3.7.3
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Dec 2016 18:12:18 -0000
Content-Type: text/plain; charset=UTF-8

We already include a recipe for puppet 3.7.3 in meta-cloud-services
(since it is not specific to openstack it is not in meta-openstack).
Without a proper long log I am unable to determine what your intention
is here. Can you explain what is being accomplished with this commit?

Thanks,
Mark

On Tue, Nov 25, 2014 at 10:47 PM, YangHaibo <b40869@freescale.com> wrote:
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

