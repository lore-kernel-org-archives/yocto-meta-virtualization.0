Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68BA0E00CAF; Wed, 23 Nov 2016 11:53:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A581EE0050B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:53:50 -0800 (PST)
Received: by mail-yw0-f195.google.com with SMTP id s68so1195924ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6iKetIbsheMTOr/hz36831JBAfXQ2cHLX8zP0KUZ4NI=;
	b=gFIeioyU2mwuAKVGliFKVoO2n4wdhb60uLQpnJgpDsl/S6xg4nlZUcHfoPlraXFmWF
	yqYiRrQ1T/Cbern/DTHZEmjmZJZcpeEnMenI51Wm4zBsRLX9hXSMysiXTmcc01qsBy8D
	RZqaknSQ5Pi04AC19r51XdVRdxZUM3MXLlbJKXwsXL59Nz2eWr1uCRmdgNb0IFyLWhYj
	qT7rIiZQIvYr51suD2MFa6IsFZOy5Yxbl2mGv3M2w0rsdktVdC1hkh8FE3wT3e76Vew+
	ru09+5ReMP82YNIO+zwnQEYoA9IHo5qVb8oap7QO9a0yuUdNpz0+L0iqpSM0lNqprF/y
	ebVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=6iKetIbsheMTOr/hz36831JBAfXQ2cHLX8zP0KUZ4NI=;
	b=jb0R35WbOS8BmQ3zU6ykFijO9vj80WYXNgskjS0aqZg/YhMw/DH2NG5VzS9DpIgRbB
	763mmkYdZNoJfTEhyNsp3RHdwu1A4i8GykuwvI3YsoBl/9gA11aEozvz5IV+BNFWoix2
	QK6KTp3NNXZCmHmi0U4GrVvODnE7HbaFHMU6denvUXLpQ9UoX3XalrWb3b22/FY3UM/0
	/gTZxvaiS23jPvrSfAvsi+L62PHOT1JyoPeFCxtFAt84av8ctQneKt7DqHWjmnkeE0N2
	7BtBDSqik3ZndF5WDgTqPFFopOLlNlFm2XTI8XQv0xE3sjwJmPBmjAIFslfczLGzHNBU
	hL1w==
X-Gm-Message-State: AKaTC02v68zLs+fMHmyP0thCOQUiWOQnISzLFUpe6d4aBoTJVYheNLhIFm9CNcWS6dUa6Kh/3o/t3fPk/goMEQ==
X-Received: by 10.13.197.68 with SMTP id h65mr5519135ywd.84.1479930830203;
	Wed, 23 Nov 2016 11:53:50 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Wed, 23 Nov 2016 11:53:49 -0800 (PST)
In-Reply-To: <CADkTA4NnjFPBL9H1cnRp0ew4B_WBLAhVmLh+7-oTvtPCQ_FSAA@mail.gmail.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
	<1479840976-10540-2-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4NnjFPBL9H1cnRp0ew4B_WBLAhVmLh+7-oTvtPCQ_FSAA@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 23 Nov 2016 14:53:49 -0500
X-Google-Sender-Auth: F80BXX7Tex4lu060FFkysZ-jDHA
Message-ID: <CAPuovEKfVEN5qZs0sKbu-hjLGPp=0LZ+cVGJTO-aTcG2GmGcPA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] lxc: updates to allow the creation of lxcbr0 with systemd
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
X-List-Received-Date: Wed, 23 Nov 2016 19:53:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 2:17 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>>
>> The recipe is setup to create lxcbr0 when used with sysvinit but there
>> are some gaps to getting this bridge working when the system is built
>> with systemd. Using parts found in the upstream package as well as
>> configurations hints from other distros we can fill in the gaps to
>> allow lxcbr0 to be created at startup, with the lxc-networking package
>> is included in the rootfs.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  recipes-containers/lxc/files/default.lxc-net | 30
>> ++++++++++++++++++++++++++++
>>  recipes-containers/lxc/files/dnsmasq.lxc     |  5 +++++
>>  recipes-containers/lxc/lxc_2.0.0.bb          | 16 +++++++++++++--
>>  3 files changed, 49 insertions(+), 2 deletions(-)
>>  create mode 100644 recipes-containers/lxc/files/default.lxc-net
>>  create mode 100644 recipes-containers/lxc/files/dnsmasq.lxc
>>
>> diff --git a/recipes-containers/lxc/files/default.lxc-net
>> b/recipes-containers/lxc/files/default.lxc-net
>> new file mode 100644
>> index 0000000..8013453
>> --- /dev/null
>> +++ b/recipes-containers/lxc/files/default.lxc-net
>> @@ -0,0 +1,30 @@
>> +# Sourced from package lxc.spec file
>> +#
>> +# Leave USE_LXC_BRIDGE as "true" if you want to use lxcbr0 for your
>> +# containers.  Set to "false" if you'll use virbr0 or another existing
>> +# bridge, or mavlan to your host's NIC.
>> +USE_LXC_BRIDGE="true"
>> +
>> +# If you change the LXC_BRIDGE to something other than lxcbr0, then
>> +# you will also need to update your /etc/lxc/default.conf as well as the
>> +# configuration (/var/lib/lxc/<container>/config) for any containers
>> +# already created using the default config to reflect the new bridge
>> +# name.
>> +# If you have the dnsmasq daemon installed, you'll also have to update
>> +# /etc/dnsmasq.d/lxc and restart the system wide dnsmasq daemon.
>> +LXC_BRIDGE="lxcbr0"
>> +LXC_ADDR="10.0.3.1"
>> +LXC_NETMASK="255.255.255.0"
>> +LXC_NETWORK="10.0.3.0/24"
>> +LXC_DHCP_RANGE="10.0.3.2,10.0.3.254"
>> +LXC_DHCP_MAX="253"
>> +# Uncomment the next line if you'd like to use a conf-file for the lxcbr0
>> +# dnsmasq.  For instance, you can use 'dhcp-host=mail1,10.0.3.100' to
>> have
>> +# container 'mail1' always get ip address 10.0.3.100.
>> +#LXC_DHCP_CONFILE=/etc/lxc/dnsmasq.conf
>> +
>> +# Uncomment the next line if you want lxcbr0's dnsmasq to resolve the
>> .lxc
>> +# domain.  You can then add "server=/lxc/10.0.3.1' (or your actual
>> $LXC_ADDR)
>> +# to /etc/dnsmasq.conf, after which 'container1.lxc' will resolve on your
>> +# host.
>> +#LXC_DOMAIN="lxc"
>> diff --git a/recipes-containers/lxc/files/dnsmasq.lxc
>> b/recipes-containers/lxc/files/dnsmasq.lxc
>> new file mode 100644
>> index 0000000..36be353
>> --- /dev/null
>> +++ b/recipes-containers/lxc/files/dnsmasq.lxc
>> @@ -0,0 +1,5 @@
>> +# Tell any system-wide dnsmasq instance to make sure to bind to
>> interfaces
>> +# instead of listening on 0.0.0.0
>> +# WARNING: changes to this file will get lost if lxc is removed.
>> +bind-interfaces
>> +except-interface=lxcbr0
>> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb
>> b/recipes-containers/lxc/lxc_2.0.0.bb
>> index 5e45949..9e15508 100644
>> --- a/recipes-containers/lxc/lxc_2.0.0.bb
>> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
>> @@ -30,6 +30,8 @@ SRC_URI =
>> "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>>         file://lxc-fix-B-S.patch \
>>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch
>> \
>> +       file://default.lxc-net \
>> +       file://dnsmasq.lxc \
>>         "
>>
>>  SRC_URI[md5sum] = "04a7245a614cd3296b0ae9ceeeb83fbb"
>> @@ -40,7 +42,7 @@ S = "${WORKDIR}/${BPN}-${PV}"
>>  # Let's not configure for the host distro.
>>  #
>>  PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
>> '--enable-tests', '', d)}"
>> -EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
>> +EXTRA_OECONF += "--with-distro=yocto ${PTEST_CONF}"
>
>
> Is there a reason why ${DISTRO} doesn't work here ? I don't think we want to
> hardcode
> yocto as a distro.

---Replying to All this time---

Damn, I meant to revert this. Originally I was experimenting with patching LXC
to know about disto other than the usual ubu, redhat... but I didn't
go that route
and so this change is unneeded. I will be sure to drop this from my V2.

Thanks for catching this.

Mark

>
>>
>>
>>  EXTRA_OECONF += "--with-init-script=\
>>  ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
>> @@ -76,6 +78,10 @@ SYSTEMD_PACKAGES = "${PN}-setup"
>>  SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
>>  SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
>>
>> +SYSTEMD_PACKAGES += "${PN}-networking"
>> +SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
>> +SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
>> +
>>  INITSCRIPT_PACKAGES = "${PN}-setup"
>>  INITSCRIPT_NAME_{PN}-setup = "lxc"
>>  INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
>> @@ -89,7 +95,8 @@ PACKAGES =+ "${PN}-templates ${PN}-setup
>> ${PN}-networking"
>>  FILES_${PN}-templates += "${datadir}/lxc/templates"
>>  RDEPENDS_${PN}-templates += "bash"
>>
>> -ALLOW_EMPTY_${PN}-networking = "1"
>> +FILES_${PN}-networking += "/etc/default/lxc-net"
>> +FILES_${PN}-networking += "/etc/dnsmasq.d/lxc"
>>
>>  FILES_${PN}-setup += "/etc/tmpfiles.d"
>>  FILES_${PN}-setup += "/lib/systemd/system"
>> @@ -126,6 +133,11 @@ do_install_append() {
>>             if [ -d ${D}${exec_prefix}/lib/python* ]; then mv
>> ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
>>             rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
>>         fi
>> +
>> +       install -d ${D}${sysconfdir}/default
>> +       install -d ${D}${sysconfdir}/dnsmasq.d
>> +       install -m 644 ${WORKDIR}/default.lxc-net
>> ${D}${sysconfdir}/default/lxc-net
>> +       install -m 644 ${WORKDIR}/dnsmasq.lxc
>> ${D}${sysconfdir}/dnsmasq.d/lxc
>
>
> Everything else looks good to me. If you install the -networking packge ..
> you get
> the networking configuration.
>
> Bruce
>
>>
>>  }
>>
>>  EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

