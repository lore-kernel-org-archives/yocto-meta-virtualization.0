Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8C3DE00C2F; Tue, 29 Mar 2016 10:03:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.52 listed in list.dnswl.org]
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2211E00C27
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 10:03:03 -0700 (PDT)
Received: by mail-oi0-f52.google.com with SMTP id h6so31318745oia.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=dreMBetuJaElGdpudL2NTrqIL4seRhQRDj4bwvjptkM=;
	b=iEb/UL/1q5SQl6K0uKh8f/Wcdb8+XEbTP0O8pVVUNAg1xgvV2qzsXeixL+xGXfi54S
	dKCzfKwutyzQIHCkcALRME1srAS667P+W7EY0CvQL8caYkIuoxLi6rHKklnI8F8GenyR
	Eyow96WmtBsMN733CUWyFaXEEGFB7tB5PBTLFBW1/D/QmRBx+8GYFogzoOgWln6SOljs
	a/6xiuUHpvUhzbiy7qj0Klee0LickX2mf/45g136K/V/V+t5Puw8lxqp//wmHjqhcAfA
	empuhb8HD0xfArLD1BNyDmIpFyk1elAUU64/xAINbwPrFHzPa0CUDmYrHTfKK91tX9Ta
	apHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=dreMBetuJaElGdpudL2NTrqIL4seRhQRDj4bwvjptkM=;
	b=DIo8naAYe6tmNtZ366Pslwp0OMOcLMXZ+IO+jJ73oI/HXmpNyGCTSlnaX9WHvMnjAF
	kuoY1CllN0B5D4USnE9zeEklO/cjubV+X29PTofvxwv2l0PAarBFI/WPoKdEjwsZ4HJb
	m4MAMWKQ7OXbYYwxR730iWiLwcA3Cm7+unDpC68cNa3gA5oySPgvzqQzuQ3vAUON3oAk
	hnNmOXJvLEcPK+g77qjrM6f7DFwWQ4evQjy6QKhjE5L++kk6BfmMfrS4BRbcZ+RT5qvo
	Gh7kAK2SrWufxBAra1TMMVdt83b7w2RHEgod1cwyd/foS/3Gm8V+2vos/sdrcXDvJvWv
	hLcw==
X-Gm-Message-State: AD7BkJL0+2pbz8y2I3p3p+y3m0nZ8G/ePTr8Lxcx0H5i0BJNqTMYcens215FyDS/koHaJZBw2ULhrJqBHE0cqQ==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr1837488oib.96.1459270975473; Tue,
	29 Mar 2016 10:02:55 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 29 Mar 2016 10:02:55 -0700 (PDT)
In-Reply-To: <1459255600-14043-1-git-send-email-derek@asterius.io>
References: <1459255600-14043-1-git-send-email-derek@asterius.io>
Date: Tue, 29 Mar 2016 13:02:55 -0400
Message-ID: <CADkTA4NEX_-aS696AS--SbQwvbCXbGboZNvRXgnvHG7xfetnqw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCHv2 1/4] xen: split the flask package into a policy and tools package
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
X-List-Received-Date: Tue, 29 Mar 2016 17:03:05 -0000
Content-Type: multipart/alternative; boundary=001a113d5edc1fcfdd052f33003b

--001a113d5edc1fcfdd052f33003b
Content-Type: text/plain; charset=UTF-8

v2 is merged to master and jethro. For whatever reason, I had conflicts on
jethro
.. which I resolved. If anyone is using jethro, and I've hosed the
resolution, fixup
patches are gladly accepted!

Cheers,

Bruce

On Tue, Mar 29, 2016 at 8:46 AM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-extended/xen/xen.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 2eba012..bc5ff85 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -153,6 +153,7 @@ PACKAGES = "\
>      ${PN}-doc \
>      ${PN}-efi \
>      ${PN}-flask \
> +    ${PN}-flask-tools \
>      ${PN}-fsimage \
>      ${PN}-gdbsx \
>      ${PN}-hvmloader \
> @@ -342,13 +343,16 @@ FILES_${PN}-devd = "\
>      "
>
>  FILES_${PN}-flask = "\
> +    /boot/xenpolicy-${PV} \
> +    "
> +
> +FILES_${PN}-flask-tools = "\
>      ${sbindir}/flask-get-bool \
>      ${sbindir}/flask-getenforce \
>      ${sbindir}/flask-label-pci \
>      ${sbindir}/flask-loadpolicy \
>      ${sbindir}/flask-set-bool \
>      ${sbindir}/flask-setenforce \
> -    /boot/xenpolicy-${PV} \
>      "
>
>  FILES_${PN}-gdbsx = "\
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113d5edc1fcfdd052f33003b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v2 is merged to master and jethro. For whatever reason, I =
had conflicts on jethro<div>.. which I resolved. If anyone is using jethro,=
 and I&#39;ve hosed the resolution, fixup</div><div>patches are gladly acce=
pted!</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div>=
<div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Mar =
29, 2016 at 8:46 AM, Derek Straka <span dir=3D"ltr">&lt;<a href=3D"mailto:d=
erek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Signed-off-by: Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 2eba012..bc5ff85 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -153,6 +153,7 @@ PACKAGES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-doc \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-efi \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-flask \<br>
+=C2=A0 =C2=A0 ${PN}-flask-tools \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-fsimage \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-gdbsx \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-hvmloader \<br>
@@ -342,13 +343,16 @@ FILES_${PN}-devd =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-flask =3D &quot;\<br>
+=C2=A0 =C2=A0 /boot/xenpolicy-${PV} \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+FILES_${PN}-flask-tools =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-get-bool \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-getenforce \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-label-pci \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-loadpolicy \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-set-bool \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/flask-setenforce \<br>
-=C2=A0 =C2=A0 /boot/xenpolicy-${PV} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-gdbsx =3D &quot;\<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div></div>

--001a113d5edc1fcfdd052f33003b--
