Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBA7AE00A62; Tue, 21 Nov 2017 16:36:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C0EBE006CA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 16:36:28 -0800 (PST)
Received: by mail-wm0-f67.google.com with SMTP id x63so6878861wmf.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 16:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EocxOxU2n7Kloga6HEfoNgjThYEuC7U28zD0klfIfLk=;
	b=Ro1NCCTuDlV/HOCNP00FOz6VXpr0wr6xOKmqNAFPe5bj03oXIh7wmx0z8gOUqVZCZ1
	rJ7wfbRTm8d47fyIOrpez18iBNu34NcCT0MYy4KY+irdW9xD3+YOKaYl94dLfmK3nET4
	AYKw7sozv2Or3d9p1Qb9SOc8z98c8xTbSmUt/dt1WyE+yQ01uF7dOMiNu3OLjl8EZeix
	hZDJK8q5iGjfEaHCRrdjbaXaaTYeyOpWWmL47mHLSTiPCh//6dqeBekvRIS96ni2eZYT
	qLvCgp97oZ8CYYotY2qtBQxXBqJuEWOX9gHbqFReIcBHROhPg0BZRAQDvNT62UFV1g3F
	xM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EocxOxU2n7Kloga6HEfoNgjThYEuC7U28zD0klfIfLk=;
	b=QuqudcCmtDsw1Vb2NZZDpDpD33FOVXymlALlOeIE/gpxY4W/EbK4f9epQafHO1jHC3
	1yomIFcWMxMBOYHT/mufok1wgcy47Bm/oiShddzqtj1KRpOpf7EK7Y90TMD3kJdvFOZT
	gSxR0GdJfKxwn6vRvMPKcTllkjGZMHpoGbnMVLf4smI4TS7sLygG4y6g+rZ5LYX+sX12
	HMF4Mee4jasSP1TROisbleLF2qKgYyhu4yGbrNqZylaQxUufB1Cv0+nFH2sHZr6rwKdv
	ido4T/24xUIJKCVkTKLaM53cnpk6MAApaz5J6ypJ/Owxng0JWST4hWlds4TfDYNnVxY+
	lX4A==
X-Gm-Message-State: AJaThX6kw3THzZj7LGu01IwBABfOawhmFM9TEqTPh7cxqGcWThAEfzZZ
	noIfYRiy4Rhyhmm8omxeAqsJXPWpdlq1WbWHoWk=
X-Google-Smtp-Source: AGs4zMa8XcMiPBJt7yQl75ErvmnhSKtbN7CLfTMhcq5GpI66HYW4V3H0+hPJ3iWHUz6BYczcYEcqsG2g1mHDo5JPw6E=
X-Received: by 10.28.166.193 with SMTP id p184mr2438845wme.6.1511310987543;
	Tue, 21 Nov 2017 16:36:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Tue, 21 Nov 2017 16:35:57 -0800 (PST)
In-Reply-To: <CACMJ4Gb+vO47iWNV9qiedWXuDSKjeo0t1NNUuuE+x+5eWSVPuw@mail.gmail.com>
References: <20171116224123.28383-1-alistair.francis@xilinx.com>
	<CADkTA4PjjqEU-wj7qJnEnn2B-WpGpVVTqU1c-wD3A-Z-uxjNzw@mail.gmail.com>
	<CACMJ4Gb+vO47iWNV9qiedWXuDSKjeo0t1NNUuuE+x+5eWSVPuw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2017 16:35:57 -0800
Message-ID: <CAKmqyKPs1j3Jty04wvCG_wyxHhhJyBSCxSObBzn-4kSuC+JwKw@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC] xen: Enable compilation with external source
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
X-List-Received-Date: Wed, 22 Nov 2017 00:36:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 21, 2017 at 12:53 PM, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
> On Tue, Nov 21, 2017 at 12:07 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>
>> On Thu, Nov 16, 2017 at 5:41 PM, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>>>
>>> When building Xen from an external source the compile step fails as
>>> there is no Makefile (or anything else) copied into the Yocto
>>> build directories.
>>
>> I can't say that I have an opinion on this, since I'm not up to speed on all
>> the moving parts.
>>
>> I haven't seen any replies from the Xen folks, so replying in the hopes that
>> they'll see this and notice the thread.
>
> Hello - thanks for the nudge.
>
>> One question though. When you say 'external source' are you talking about
>> the oe-core "externalsrc" concept, or some Xen specific thing ?

I'm talking about the OE external source, it's not a Xen specific thing.

>
> I've never used the externalsrc class, so this review is a bit tricky.
>
> Alistair: There's a comment at the top of the externalsrc.bbclass file
> that indicates that a second variable (EXTERNALSRC_BUILD_pn-myrecipe)
> could be used to set the build directory to be the same as the source
> directory -- does using that give the behaviour that you're looking
> for, without needing this cp added to do_compile?

Ah, that is what I needed. That at least allows me to build Xen, but I
see all these weird QA issues now.

WARNING: xen-4.9.0-r0 do_package: QA Issue: xen: Files/directories
were installed but not shipped in any package:
  /usr/lib/libxentoolcore.so.1.0
  /usr/lib/libxentoolcore.so
  /usr/lib/libxentoolcore.so.1
  /usr/sbin/xen-diag
  /usr/share/pkgconfig/xentoolcore.pc
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
xen: 5 installed and not shipped files. [installed-vs-shipped]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxenlight.so.4.10.0 contained in package xen-libxenlight
requires libxentoolcore.so.1()(64bit), but no providers found in
RDEPENDS_xen-libxenlight? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/xen/bin/libxl-save-helper contained in package xen-xl
requires libxentoolcore.so.1()(64bit), but no providers found in
RDEPENDS_xen-xl? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxencall.so.1.0 contained in package xen-libxencall
requires libxentoolcore.so.1(VERS_1.0)(64bit), but no providers found
in RDEPENDS_xen-libxencall? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxencall.so.1.0 contained in package xen-libxencall
requires libxentoolcore.so.1()(64bit), but no providers found in
RDEPENDS_xen-libxencall? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxenstore.so.3.0.3 contained in package xen-libxenstore
requires libxentoolcore.so.1(VERS_1.0)(64bit), but no providers found
in RDEPENDS_xen-libxenstore? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxenstore.so.3.0.3 contained in package xen-libxenstore
requires libxentoolcore.so.1()(64bit), but no providers found in
RDEPENDS_xen-libxenstore? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxenevtchn.so.1.1 contained in package xen-libxenevtchn
requires libxentoolcore.so.1(VERS_1.0)(64bit), but no providers found
in RDEPENDS_xen-libxenevtchn? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxenevtchn.so.1.1 contained in package xen-libxenevtchn
requires libxentoolcore.so.1()(64bit), but no providers found in
RDEPENDS_xen-libxenevtchn? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxengnttab.so.1.1 contained in package xen-libxengnttab
requires libxentoolcore.so.1(VERS_1.0)(64bit), but no providers found
in RDEPENDS_xen-libxengnttab? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxengnttab.so.1.1 contained in package xen-libxengnttab
requires libxentoolcore.so.1()(64bit), but no providers found in
RDEPENDS_xen-libxengnttab? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue: /usr/bin/xenstore-write
contained in package xen-xenstore requires
libxentoolcore.so.1()(64bit), but no providers found in
RDEPENDS_xen-xenstore? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxendevicemodel.so.1.1 contained in package
xen-libxendevicemodel requires libxentoolcore.so.1(VERS_1.0)(64bit),
but no providers found in RDEPENDS_xen-libxendevicemodel? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxendevicemodel.so.1.1 contained in package
xen-libxendevicemodel requires libxentoolcore.so.1()(64bit), but no
providers found in RDEPENDS_xen-libxendevicemodel? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxenforeignmemory.so.1.2 contained in package
xen-libxenforeignmemory requires libxentoolcore.so.1(VERS_1.0)(64bit),
but no providers found in RDEPENDS_xen-libxenforeignmemory?
[file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA Issue:
/usr/lib/libxenforeignmemory.so.1.2 contained in package
xen-libxenforeignmemory requires libxentoolcore.so.1()(64bit), but no
providers found in RDEPENDS_xen-libxenforeignmemory? [file-rdeps]
ERROR: xen-4.9.0-r0 do_package_qa: QA run found fatal errors. Please
consider fixing them.
ERROR: xen-4.9.0-r0 do_package_qa: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
/scratch/alistai/yocto/oe-master/build/tmp-glibc/work/aarch64-oe-linux/xen/4.9.0-r0/temp/log.do_package_qa.5847
ERROR: Task (/scratch/alistai/yocto/oe-master/meta-virtualization/recipes-extended/xen/xen_4.9.0.bb:do_package_qa)
failed with exit code '1'

I'll have to dig into what is going on here. It looks like this patch
isn't required though.

Thanks,
Alistair

>
> Christopher
>
>
>>
>> Bruce
>>
>>>
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>> This seems really nasty, but it's the only way I can get external
>>> source build working.
>>>
>>>  recipes-extended/xen/xen.inc | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>>> index cb314f8..7a54416 100644
>>> --- a/recipes-extended/xen/xen.inc
>>> +++ b/recipes-extended/xen/xen.inc
>>> @@ -901,7 +901,6 @@ EXTRA_OEMAKE += "XEN_CONFIG_EXPERT=y"
>>>  EXTRA_OEMAKE += "debug=n"
>>>
>>>  do_configure() {
>>> -
>>>      #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done
>>> manually
>>>      if [ "${XSM_ENABLED}" = "1" ]; then
>>>          echo "XSM_ENABLE := y" > ${S}/.config
>>> @@ -920,6 +919,9 @@ do_configure() {
>>>  }
>>>
>>>  do_compile() {
>>> +    # If using external source we need to copy the code in
>>> +    cp -rf ${S}/* ${B}/
>>> +
>>>      # workaround for build bug when CFLAGS is exported
>>>      # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
>>>      unset CFLAGS
>>> --
>>> 2.14.1
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
>> its end"
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

