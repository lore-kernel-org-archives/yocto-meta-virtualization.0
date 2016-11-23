Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AAC3E008CA; Wed, 23 Nov 2016 11:53:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D92BFE0050B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:53:06 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id b66so1183976ywh.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qDI03tEvOWXu3r+h7TLjFgM3TJLbsuisxeapyOEiFHs=;
	b=MZaHco7RLUzUqIJ6JFB4ixkUYHdUIB7IMPJBblmkEFGfzU+DqRUHLh500rN424mtue
	qWyQ3SdaiY0rZjNeLopRHA+9YZnXgjI/N8Pf4fcGY2do7unTG/QrXwQDOPX+1StQlINd
	Soi2XxwsKbBnG+eOJO6tklFbOGNECntXAlJBg9gsGrZOUJQT6OErLLo0NTyrqAduiK7U
	Zk8sVVWavkpImOa69yx6q+qQV67QSaKPY9V3B4psX5IbaJ6G9T9MYjNoz/9yP2oVP+Tt
	m4CLRH5wQOYYVrYfskYbBUJ6VPmUOvO4h2HWHFgNZOB0AJO5AEmTMSFldiqD4U4C33Wv
	1khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=qDI03tEvOWXu3r+h7TLjFgM3TJLbsuisxeapyOEiFHs=;
	b=KEpCUAJVXYEyyUDMXjSEPoIbs3v/n1GdF6iFpEickrsJPebaD9K0i0p7Wc6gfdaODd
	9aNbDy8dqDBpY398Ta0zMupYiVCBp9m7d8N1Jf/NsS+1SGBVxMQEIrkWKPkJTSnUjqtL
	jq6tiTgNc5V3I3io/fi+/ToKKcYyBK4J1mL2Kj0kvq1RnDNfywASXt2lRktRc04pN50Q
	WnIWiyp92YB1P75civKV07IGCfyLMWpa4u4yc8XTVNpjFQ0rjDcT8/6SdEiIuqRTf/gu
	HereZqG25rSDaDEKcBmYDyz7bAsoRGNfYGr7Hq+1z5/fRVBIQvGc0gXp3cK3fqt8g1Yv
	GFZQ==
X-Gm-Message-State: AKaTC0098MxqrhUgnLNlEBXEag5nwStbQh7voEtxEYRWTH100SIzlT2uepMbf8mWUOi+hJzE3AzHwERPFP10MQ==
X-Received: by 10.129.99.195 with SMTP id x186mr5487166ywb.182.1479930785724; 
	Wed, 23 Nov 2016 11:53:05 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Wed, 23 Nov 2016 11:53:05 -0800 (PST)
In-Reply-To: <CADkTA4P335iwDjNTQrw=22YaLYQnpx+fD7zB4giKGSqi5CPxdg@mail.gmail.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
	<1479840976-10540-4-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4P335iwDjNTQrw=22YaLYQnpx+fD7zB4giKGSqi5CPxdg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 23 Nov 2016 14:53:05 -0500
X-Google-Sender-Auth: 9fc848UzADIgfb91AT4Nz1WLZsk
Message-ID: <CAPuovE+HxNKaAJVm0WQL_RMDa6rfp0DiFJU1eLZq5t-DV5DE5g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] libvirt: change how we make updates to the dnsmasq configuration
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
X-List-Received-Date: Wed, 23 Nov 2016 19:53:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 2:24 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>>
>> Our old approach of making the default configuration of dnsmasq use
>> 'bind-dynamic' has some negative side effects. ie. by making this
>> change when meta-virtualization is used but when libvirtd is not
>> installed in the rootfs we prevent dnsmasq from binding to all
>> interfaces (which is the expected/builtin default behavior of
>> dnsmasq). The results can also be non-deterministic when multiple
>> instances of dnsmasq are being run (which instance configured with
>> bind-dynamic should attend to new network interfaces?)
>>
>> Additionally our approach modifies the default dnsmasq configuration
>> file which ideally should have now changes, allowing dnsmasq to be
>> configured using its builtin configuration values and also allowing
>> for other instances of dnsmasq to better reuse the default
>> configuration file.
>>
>> These changes allow for better coexistence of libvirt with packages
>> like lxc which run their own instances of dnsmasq.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon | 2 ++
>>  recipes-extended/libvirt/libvirt_1.3.5.bb               | 6 ++++++
>>  2 files changed, 8 insertions(+)
>>  create mode 100644
>> recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
>>
>> diff --git a/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
>> b/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
>> new file mode 100644
>> index 0000000..a7c3059
>> --- /dev/null
>> +++ b/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
>> @@ -0,0 +1,2 @@
>> +bind-interfaces
>> +except-interface=virbr0
>> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb
>> b/recipes-extended/libvirt/libvirt_1.3.5.bb
>> index c848c99..b8e8159 100644
>> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
>> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
>> @@ -37,6 +37,7 @@ SRC_URI =
>> "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>>
>> file://0001-qemu-Let-empty-default-VNC-password-work-as-document.patch \
>>             file://0001-ptest-add-missing-test_helper-files.patch \
>>
>> file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
>> +           file://dnsmasq.libvirt-daemon \
>>            "
>>
>>  SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
>> @@ -112,6 +113,7 @@ FILES_${PN}-libvirtd = " \
>>         ${sbindir}/libvirtd \
>>         ${systemd_unitdir}/system/* \
>>         ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '',
>> '${libexecdir}/libvirt-guests.sh', d)} \
>> +       ${sysconfdir}/dnsmasq.d/libvirt-daemon \
>
>
> I'm not a packaging expert .. but should one package be installing config
> files for another ?
> Wouldn't this imply that libvirt really needs to be a distro feature, and
> then we can make all
> the behaviour changes trigger off a single variable ?
>
> My point is .. from the libvirt package, I'm not aware of how dnsmasq sees
> this file "libvirt-daemon".. what exactly does it do ? Does it match on the
> executable
> name ? Are all the files in dnsmasq.d always processed on startup of dnsmasq
> ?
> .. what if there are competing settings from other packages ?

Basically dnsmasq "offers" the /etc/dnsmasq.d directory for other packages
to put configuration snippets. One of the changes I sent to meta-openembedded
(which I mention in my 0 of N) includes the change that dnsmasq will look
for snippets in this directory. Previously they were creating the
directory but not
doing anything with it. With this in place it is expected and acceptable that
other packages contribute config snippets.

An example might help. If I have a rootfs with dnsmasq installed but
no lxc or libvirt the
dnsmasq configuration will have dnsmasq listen on all interfaces. Now
if I have a rootfs
with dnsmasq and libvirt both installed we can't allow dnsmasq to
listen on all interfaces
as this will conflict on virbr0, for example. So libvirt contributes
this fragment that will
change the default instance of dnsmasq to only listen on specified interfaces
(bind-interfaces).

Not to use the 'if your friends jump off the bridge are you going to
too' argument that my
mother used to make, but this is inline with other distros and as far
as I can tell is the
expected behavior.

Mark


>
> Bruce
>
>>
>>          "
>>
>>  FILES_${PN}-virsh = "${bindir}/virsh"
>> @@ -258,6 +260,10 @@ do_install_append() {
>>         for i in `find ${D}${libdir} -type f -name *.la`; do
>>             sed -i -e 's#-L${B}/src/.libs##g' $i
>>         done
>> +
>> +       # ensure dnsmasq doesn't default to listenning on all interfaces
>> +       install -d ${D}/${sysconfdir}/dnsmasq.d
>> +       install -m 644 ${WORKDIR}/dnsmasq.libvirt-daemon
>> ${D}/${sysconfdir}/dnsmasq.d/libvirt-daemon
>>  }
>>
>>  EXTRA_OECONF += " \
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

