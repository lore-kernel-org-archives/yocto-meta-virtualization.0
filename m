Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46BCEE007F2; Tue,  1 May 2018 10:49:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB84AE006B4
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 10:49:45 -0700 (PDT)
Received: by mail-lf0-f54.google.com with SMTP id h197-v6so17187194lfg.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 10:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GKvAkGpg7QHSRm0X4H/jhuHnVSFQBBuXyVXY2+cWQwU=;
	b=Ms4t29i8U3EMu02A5P6CKDrqr7tt2vJ5DS7HyPhnh2PBbbNgDMPOUJX72U7NbEKm7O
	ySmeol4dqF2bA4hPOVvzp9gTFNFWbJjtypsQB1w20CM+wpOnil2omFxE2wZpbEGsC1T7
	hvz5PNHYr3sxPMsiDNR6ze1HYGQQ2L7ShrDq9NWV3uRWSYpP2v14aEQMzHcgAp4PFmLx
	dz2C5mISNxzle+ZC2pupZejlBJAyTo+c+zADOdRpCP94UX0mKv9bHcvAfg6hzN2fmvbc
	n4stryY+VjyJNG72DBPs0O6a+MEK3gAASYQ4MRekMoCa+W1PahX7/1w9ulxNivXAlZne
	OAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GKvAkGpg7QHSRm0X4H/jhuHnVSFQBBuXyVXY2+cWQwU=;
	b=hfn9i/JUoHeHdilZtH9ML6tNr2+zISzFBFxDmNG2nGmkOKFWlfQCYV2gyJae6kfg+0
	aG433msuYFcWWObXpPC3pbo7vDxwY9mhcjIlJI6QwuQ8i+RmeB5UOOBVhMxpMfclGde3
	DI07HRUqXh0yXD50XwED2shh4ZR8yOklWMsF6HUInjJ49Xft6Tp/2kXhWlnfhSsV0oPp
	NhHq2yIw36y+MTUu96XvlQY97eI3tmEMchyYSvLQ+ew0ExZSAaT8hUp8XqkLEwc4Ig3o
	RoMTeaM3vHs/A6D5cLus8Decg8l6es+GMhCCxUmh/M395HoLu9EdcKr7sCI0oG0OQc0r
	rSdQ==
X-Gm-Message-State: ALQs6tAXGluzbJWG0FWiZ4PmAYTw5zBUcIq7gx9OJfkVGxLLD7J9bilv
	gStmyzerfSrKjznGBcQZopzGDe7Rn4NoPzqnYl0=
X-Google-Smtp-Source: AB8JxZqIacIIWt+1S61U4CvEEnv5KocNkkSePanK6ajbA5Pw2URd+VHNlHrAk6cx1Jy2wSNUOCXKsjuWt6Sn0B534tY=
X-Received: by 2002:a19:1895:: with SMTP id 21-v6mr9690924lfy.39.1525196984554;
	Tue, 01 May 2018 10:49:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Tue, 1 May 2018 10:49:44 -0700 (PDT)
In-Reply-To: <CACMJ4GadnwJBVVMqVX5XRSdz8Gc_X0_aOHi8CeUfZ9eVf_g5cg@mail.gmail.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
	<CACMJ4GadnwJBVVMqVX5XRSdz8Gc_X0_aOHi8CeUfZ9eVf_g5cg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 May 2018 13:49:44 -0400
Message-ID: <CADkTA4MgBkyf15Mce33hp+pm4rkeb=pWvDaosb-uTqK-kCDV2w@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
	Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: Re: [PATCH v5 0/8] xen: Xen vTPM stubdomains
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
X-List-Received-Date: Tue, 01 May 2018 17:49:47 -0000
Content-Type: multipart/alternative; boundary="0000000000007a18d2056b2898e7"

--0000000000007a18d2056b2898e7
Content-Type: text/plain; charset="UTF-8"

Looks good to me as well.

I'm out of the office on vacation, and am having trouble reaching my build
machines, so it will likely be Friday before I can get this merged.

Bruce

On Tue, May 1, 2018 at 1:22 PM, Christopher Clark <
christopher.w.clark@gmail.com> wrote:

>
>
> On Tue, May 1, 2018 at 7:05 AM, Kurt Bodiker <kurt.bodiker@braintrust-us.
> com> wrote:
>
>> This patchset introduces the basic recipes necessary to build Xen
>> stubdomains, in particular the vTPM and vTPM Manager stubdomains. vTPM
>> stubdomains provide Xen guest domains access to a virtualized TPM. The
>> vTPM Manager stubdomain manages each of the vTPM domains and seals them
>> to the physical TPM. The intention of this patchset is to provide the
>> ability to build Xen stubdomains separately from the rest of the Xen
>> components since the stubdomains have separate dependencies that are
>> hard-coded within the Xen build and configuration files.  Separating the
>> stubdomain recipes and dependencies from the rest of the Xen build gives
>> the ability to use newer or different libraries than what is currently
>> used.
>>
>> The stubdom.inc file defines a set of CPPFLAGS, CFLAGS, and LDFLAGS
>> common for building all Xen stubdomains. Xen stubdomains are
>> cross-compiled with the MiniOS, which creates some issues when trying to
>> compile stubdomains in an OpenEmbedded environment. To address these
>> issues and to ensure the stubdoms are built as Xen had intended, all of
>> the build flags and build tools that are exported into the environment
>> by OE have been unset. Each of the new recipes introduced here then
>> implements the build flags and the tools as though the build had been
>> run in the bare-metal environment.
>>
>> Recipes to create slightly modified source packages for lwIP amd Mini-OS
>> are introduced to standardize the dependency tree among stubdomain
>> related recipes and to avoid the hassle of maintaining the same tasks
>> within many recipes.
>>
>> Xen vTPM stubdomains have depencencies on static libraries for newlib,
>> polarssl, gmp, and tpm emulator. Xen vTPM Manager stubdomain has
>> dependencies on static libraries for newlib and polarssl.
>>
>> The newlib, polarssl, gmp, and tpm emulator recipes are constructed to
>> behave the same as a bare-metal build. These recipes are cross-compiled
>> against both the Xen and MiniOS source code.
>>
>> The xen-vtpm recipe is responsible for building and installing the vTPM
>> and vTPM Manager stubdomain images into the Xen boot directory. xen-vtpm
>> would need to be added to DISTRO_FEATURES the similar for what is done
>> for Xen.
>>
>> ---
>> Changes in v5:
>>  - Correct license in TPM Emulator recipe
>>  - Remove aarch64 from COMPATIBLE_HOST in stubdom.inc
>> Changes in v4:
>>  - Fix whitespace errors in MiniOS, Newlib, and TPM Emulator patchfiles
>>  - Corrected type in Newlib recipe
>> Changes in v3:
>>  - Limit builds to 64-bit only through COMPATIBLE_HOST
>>  - Change Xen version comparison logic in xen-vtpm recipe
>>  - Introduce MiniOS patch for GCC v7 that was not backported into the
>>    4.9.x releases
>>  - Change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARCH}
>> Changes in v2:
>>  - Multi-line variables formatted to match OE style guide
>>  - SRC_URI formatted to use SRCREV rather than git tag
>>  - patches formatted to striplevel=1
>>  - introduced Mini-OS recipe
>>  - Removed Xen dependency since this is handled (mostly) by Mini-OS
>>  - Changed version number of xen-vtpm recipe to match Xen version
>> ---
>>
>> Kurt Bodiker (8):
>>   Define standard values needed to build stubdomains
>>   LWIP source code with patches applied for stubdoms
>>   Mini-OS source code with make links target applied
>>   Newlib recipe and patches for Xen stubdoms
>>   PolarSSL recipe and patches for Xen stubdoms
>>   GMP recipe for Xen stubdoms
>>   TPM Emulator for Xen stubdoms
>>   vTPM and vTPM Manager stubdoms
>>
>>
> For this whole series (v5):
> Reviewed-by: Christopher Clark <christopher.clark6@baesystems.com>
>
> Thanks,
>
> Christopher
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--0000000000007a18d2056b2898e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks good to me as well.<div><br></div><div>I&#39;m out o=
f the office on vacation, and am having trouble reaching my build machines,=
 so it will likely be Friday before I can get this merged.</div><div><br></=
div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Tue, May 1, 2018 at 1:22 PM, Christopher Clark <span dir=3D"ltr=
">&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">ch=
ristopher.w.clark@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote"><div><div class=3D"h5">On Tue, May 1, 2018 at 7:05 AM, Kurt Bo=
diker <span dir=3D"ltr">&lt;<a href=3D"mailto:kurt.bodiker@braintrust-us.co=
m" target=3D"_blank">kurt.bodiker@braintrust-us.<wbr>com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">This patchset introduces the basic re=
cipes necessary to build Xen<br>
stubdomains, in particular the vTPM and vTPM Manager stubdomains. vTPM<br>
stubdomains provide Xen guest domains access to a virtualized TPM. The<br>
vTPM Manager stubdomain manages each of the vTPM domains and seals them<br>
to the physical TPM. The intention of this patchset is to provide the<br>
ability to build Xen stubdomains separately from the rest of the Xen<br>
components since the stubdomains have separate dependencies that are<br>
hard-coded within the Xen build and configuration files.=C2=A0 Separating t=
he<br>
stubdomain recipes and dependencies from the rest of the Xen build gives<br=
>
the ability to use newer or different libraries than what is currently<br>
used.<br>
<br>
The stubdom.inc file defines a set of CPPFLAGS, CFLAGS, and LDFLAGS<br>
common for building all Xen stubdomains. Xen stubdomains are<br>
cross-compiled with the MiniOS, which creates some issues when trying to<br=
>
compile stubdomains in an OpenEmbedded environment. To address these<br>
issues and to ensure the stubdoms are built as Xen had intended, all of<br>
the build flags and build tools that are exported into the environment<br>
by OE have been unset. Each of the new recipes introduced here then<br>
implements the build flags and the tools as though the build had been<br>
run in the bare-metal environment.<br>
<br>
Recipes to create slightly modified source packages for lwIP amd Mini-OS<br=
>
are introduced to standardize the dependency tree among stubdomain<br>
related recipes and to avoid the hassle of maintaining the same tasks<br>
within many recipes.<br>
<br>
Xen vTPM stubdomains have depencencies on static libraries for newlib,<br>
polarssl, gmp, and tpm emulator. Xen vTPM Manager stubdomain has<br>
dependencies on static libraries for newlib and polarssl.<br>
<br>
The newlib, polarssl, gmp, and tpm emulator recipes are constructed to<br>
behave the same as a bare-metal build. These recipes are cross-compiled<br>
against both the Xen and MiniOS source code.<br>
<br>
The xen-vtpm recipe is responsible for building and installing the vTPM<br>
and vTPM Manager stubdomain images into the Xen boot directory. xen-vtpm<br=
>
would need to be added to DISTRO_FEATURES the similar for what is done<br>
for Xen.<br>
<br>
---<br>
Changes in v5:<br>
=C2=A0- Correct license in TPM Emulator recipe<br>
=C2=A0- Remove aarch64 from COMPATIBLE_HOST in stubdom.inc <br>
Changes in v4:<br>
=C2=A0- Fix whitespace errors in MiniOS, Newlib, and TPM Emulator patchfile=
s<br>
=C2=A0- Corrected type in Newlib recipe<br>
Changes in v3:<br>
=C2=A0- Limit builds to 64-bit only through COMPATIBLE_HOST <br>
=C2=A0- Change Xen version comparison logic in xen-vtpm recipe<br>
=C2=A0- Introduce MiniOS patch for GCC v7 that was not backported into the<=
br>
=C2=A0 =C2=A04.9.x releases<br>
=C2=A0- Change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARC=
H}<br>
Changes in v2:<br>
=C2=A0- Multi-line variables formatted to match OE style guide<br>
=C2=A0- SRC_URI formatted to use SRCREV rather than git tag<br>
=C2=A0- patches formatted to striplevel=3D1<br>
=C2=A0- introduced Mini-OS recipe<br>
=C2=A0- Removed Xen dependency since this is handled (mostly) by Mini-OS<br=
>
=C2=A0- Changed version number of xen-vtpm recipe to match Xen version<br>
---<br>
<br>
Kurt Bodiker (8):<br>
=C2=A0 Define standard values needed to build stubdomains<br>
=C2=A0 LWIP source code with patches applied for stubdoms<br>
=C2=A0 Mini-OS source code with make links target applied<br>
=C2=A0 Newlib recipe and patches for Xen stubdoms<br>
=C2=A0 PolarSSL recipe and patches for Xen stubdoms<br>
=C2=A0 GMP recipe for Xen stubdoms<br>
=C2=A0 TPM Emulator for Xen stubdoms<br>
=C2=A0 vTPM and vTPM Manager stubdoms<br><span class=3D"m_15241314381556347=
29HOEnZb"><font color=3D"#888888"><br></font></span></blockquote><div><br><=
/div></div></div><div>For this whole series (v5):</div><div>Reviewed-by: Ch=
ristopher Clark &lt;<a href=3D"mailto:christopher.clark6@baesystems.com" ta=
rget=3D"_blank">christopher.clark6@<wbr>baesystems.com</a>&gt;</div><div><b=
r></div><div>Thanks,</div><div><br></div><div>Christopher=C2=A0</div></div>=
<br></div></div>
<br>-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div>

--0000000000007a18d2056b2898e7--
