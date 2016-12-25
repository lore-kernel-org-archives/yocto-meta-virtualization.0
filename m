Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA535E00524; Sun, 25 Dec 2016 10:18:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5631E00510
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:18:23 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id s68so19696766ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A8W3LQrwIPJaUspQRexbnjtLAYGb3WzqxAd0Pzas28M=;
	b=dc8WFGqFSh+yfMaGC3+xd3TGD9Ap3ilUYYIk+L2FtHmIwWqyi49N6xYbOikw90NoAe
	RZdbBf98jTPnjB3X8SR9FxN0I/xToIb5P4XAWsObJYydhPZXyBEhxiIhD4FULm5jk+Cs
	wVm1rk4kY82O2HZFREGQgG5z5KwTCADCQyNEv/BYV28IKBjnCmYJXJRDVF+ViU5wKjYN
	Dp/z59JUWlDnswV+JD6pfegrTrknUr4hQOsIVeh2FnIrTOrfYUwWT9NXJCKjtiqo3hA0
	FymM4vzuum4txinEDUUTCZprN5wAzvwbtQRU7mXXCSC5ZLbkh9pc5+xwU+mpgPt6YiDp
	7jAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=A8W3LQrwIPJaUspQRexbnjtLAYGb3WzqxAd0Pzas28M=;
	b=foc1FBpkDxp8cpOaETNu9saDsUDenrVnV8yWEmSX95FtDgARngcKGCz1lxE93/JoMJ
	9ob1phkGyA66m61CgyDSis4l2l+Dh5MslmvQOI+ALlM05kz2GI98Laz2RfO1DiELnlpb
	BD1zSOdaAJtGd90NlnR1dyDtYAuK5p6oRQJuzvSgc+2okLaxkTTR1y9c+zm/X5jbp8d6
	mPCmOhv6X3D5taqm3sT9adKd1jC1uEYBNB6LoCutJs4nOcR1nPsIUkkMA3q9y1qPRzt6
	X0GaoahJywty0vVJ2BLF7xnRpq6WlXpn+dt5LKN5YFCqDrw75eT+p0NMpvghtlj5pbKe
	0OvA==
X-Gm-Message-State: AIkVDXIRB2/IfMC/t6P9xoPyul6og/xvChnde0/WJW27kf9kueGRu40MYavBFkpMi/jRqad3wLPKw8+3sfBdOA==
X-Received: by 10.129.125.215 with SMTP id y206mr17974162ywc.234.1482689903462;
	Sun, 25 Dec 2016 10:18:23 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Sun, 25 Dec 2016 10:18:23 -0800 (PST)
In-Reply-To: <CAPuovEKaeWuG7iac4uEYfUzYoZUtL-DgJf8ztOcM0YDQiM7bpA@mail.gmail.com>
References: <1416973638-18967-1-git-send-email-b40869@freescale.com>
	<CAPuovEKaeWuG7iac4uEYfUzYoZUtL-DgJf8ztOcM0YDQiM7bpA@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sun, 25 Dec 2016 13:18:23 -0500
X-Google-Sender-Auth: Hb0QosVMk5WLPoTd1XVMrCp8abU
Message-ID: <CAPuovEJHP1ajWf52Y8Rzh8ooKg6MwDAEjXtf6JA_91BSLrFrHA@mail.gmail.com>
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
X-List-Received-Date: Sun, 25 Dec 2016 18:18:25 -0000
Content-Type: text/plain; charset=UTF-8

Please ignore my previous email. Gmail decided to display old emails
from 2014 at the top of my meta-virtualization folder. Sorry for the
noise.

Mark

On Sun, Dec 25, 2016 at 1:12 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> We already include a recipe for puppet 3.7.3 in meta-cloud-services
> (since it is not specific to openstack it is not in meta-openstack).
> Without a proper long log I am unable to determine what your intention
> is here. Can you explain what is being accomplished with this commit?
>
> Thanks,
> Mark
>
> On Tue, Nov 25, 2014 at 10:47 PM, YangHaibo <b40869@freescale.com> wrote:
>> ---
>>  .../puppet/puppet/add_puppet_gemspec.patch         | 23 ++++++++++++++++
>>  .../recipes-support/puppet/puppet_3.7.3.bb         | 31 ++++++++++++++++++++++
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
>>  create mode 100644 meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
>>
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

