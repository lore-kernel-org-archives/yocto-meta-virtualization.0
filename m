Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15483E0140A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 13:09:16 -0700 (PDT)
Received: by mail-la0-f54.google.com with SMTP id ec20so1830790lab.41
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dFvWFVoUN6ZLoKwE23CK0HdJMJKUXIQ1jj1U+BUx2Z0=;
	b=psssxReAGMZXl9N/EA/QDfBHYAN0XbRJ7EPH9fa5UOgYP7kFhhquXpMa4iik/5u5tn
	0EumbVGH8Oti23DA7PgTV++AHiTZEdVRXKkUzu+8kiHsJn0Uo3eJhBdRLNUZivuhT2/O
	42m/Sq8SdUEdCdeOmvVdeWV3i5omp6eMPsC2JbMxrSeLa5BYnzqKrfAWrX4F1e3/1fSm
	R1y33o19QJVT3nuv0qVuNbuye+sBye+9ISR1c14SIFtm+rFf1G9uxgd9O5pqJg8FZ7Et
	/l88Obld7BjJrrhSTr/2SJBScqMtGDU+KggT8Q+SLxIQXKLbELZnk+wBMprGcgJUpPto
	QHjA==
MIME-Version: 1.0
X-Received: by 10.112.147.170 with SMTP id tl10mr3962621lbb.100.1365710955179; 
	Thu, 11 Apr 2013 13:09:15 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Thu, 11 Apr 2013 13:09:15 -0700 (PDT)
In-Reply-To: <CADkTA4P=4JfzktEYZcxeRr=phYa4FecWhTBFapDtTQLhfCWmXg@mail.gmail.com>
References: <1365671972-8194-1-git-send-email-bogdan.purcareata@freescale.com>
	<CADkTA4P=4JfzktEYZcxeRr=phYa4FecWhTBFapDtTQLhfCWmXg@mail.gmail.com>
Date: Thu, 11 Apr 2013 16:09:15 -0400
Message-ID: <CADkTA4N+GhTvhfmTYZ2au=M6M2--LJ3WtZn5tB62-q04VTE7Hg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] Add LXC 0.9.0 recipe
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
X-List-Received-Date: Thu, 11 Apr 2013 20:09:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 11, 2013 at 9:32 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Thu, Apr 11, 2013 at 5:19 AM, Bogdan Purcareata
> <bogdan.purcareata@freescale.com> wrote:
>> Introducing the LXC 0.9.0 recipe.
>>
>> Maintainer log for intermediate versions since LXC 0.8.0. This only contains
>> the major differences between versions. You may find the complete log on the
>> SourceForge LXC devel mailing list [1].
>>
>
> Thanks for the resend, these look good. I've staged them here and will do a
> quick build test, and push them once it passes.

I pushed these changes to the layer, with a bit of re-wording on the shortlogs.
I also removed the 0.8.0 recipe, since we want to support one version, not
many.

We can tweak things in the layer if this causes any problems.

Cheers,

Bruce



>
> Cheers,
>
> Bruce
>
>> 0.9.0.alpha1:
>> - Introduction of the new liblxc API
>> - Python bindings
>> - New tools:
>>    - lxc-device
>>    - lxc-start-ephemeral
>>    - python version of lxc-ls
>> - lxc.autodev support
>> - oracle template
>> - reworked lxc-attach
>> - /etc/lxc/lxc.conf configuration
>> - Switch to new docbook
>> - A lot of other improvements, new features and bugfixes
>>
>> 0.9.0.alpha2: bug fix for issue with 0.9.0.alpha1 - no significant changes
>>
>> 0.9.0.alpha3:
>> - Android support
>> - New lua binding
>> - User namespace support
>> - Oracle template
>> - Manpage updates
>> - POSIX shell support for most scripts
>> - Improved systemd support
>> - Various API improvements
>> - Logging improvements
>>
>> 0.9.0.rc1:
>> - Addition of -P option to all executables (to specify lxcpath)
>> - Rework of the cgroup handling code
>> - Rework of lxc-attach for userns
>> - Updates to the alpine, archlinux, opensuse, oracle and ubuntu
>> templates. Removal of the lenny template.
>> - Introduction of a new lxc.stopsignal option
>> - Introduction of a new lxc.kmsg option
>> - Various userns improvements
>> - New --host option in lxc-ps
>> - Introduction of a few examples lxc hooks
>> - Support for nested containers in lxc-ls
>> - Introduction of get_version in the C API.
>> - And a variety of bugfixes
>>
>> 0.9.0:
>> Feature changes include:
>>  - Support for ephemeral containers in lxc-clone
>>  - --clear-env/--keep-env support in lxc-attach
>>  - -n option to lxc-start-ephemeral
>> Everything else is bugfixes on top of rc1.
>> Tests done by maintainers:
>>  - Test build on my machine (up to date Ubuntu 13.04)
>>  - Test build on Launchpad (Ubuntu 12.04, 12.10 and 13.04)
>>  - Test build on an armhf board running Ubuntu 13.04
>>  - Test build for Android cross-compiling on my laptop
>>  - Ran our test suite on the x86 binaries
>>  - Ran a quick test (start/stop/info/wait) on Android
>>  - Tested the API and tools on ARM
>>  - Rebuilt all my local templates (~20 containers) on a variety of
>>    architectures (i386, amd64, armel and armhf)
>>
>> [1] https://lists.sourceforge.net/lists/listinfo/lxc-develIntroducing the LXC 0.9.0 recipe.
>>
>> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
>> ---
>>  recipes-containers/lxc/lxc_0.9.0.bb | 38 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>  create mode 100644 recipes-containers/lxc/lxc_0.9.0.bb
>>
>> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
>> new file mode 100644
>> index 0000000..292285d
>> --- /dev/null
>> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
>> @@ -0,0 +1,38 @@
>> +DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
>> +SECTION = "console/utils"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>> +PRIORITY = "optional"
>> +PR = "r1"
>> +DEPENDS = "libxml2 libcap"
>> +RDEPENDS_${PN} = " \
>> +               rsync \
>> +               gzip \
>> +               libcap-bin \
>> +               bridge-utils \
>> +               dnsmasq \
>> +               perl-module-strict \
>> +               perl-module-getopt-long \
>> +               perl-module-vars \
>> +               perl-module-warnings-register \
>> +               perl-module-exporter \
>> +               perl-module-constant \
>> +               perl-module-overload \
>> +               perl-module-exporter-heavy \
>> +"
>> +
>> +SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
>> +       "
>> +SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
>> +SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
>> +
>> +S = "${WORKDIR}/${PN}-${PV}"
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[doc] = "--enable-doc,--disable-doc"
>> +PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath"
>> +PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
>> +
>> +inherit autotools
>> +
>> +FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
>> --
>> 1.7.11.7
>>
>>
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

