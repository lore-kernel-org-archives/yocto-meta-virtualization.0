Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B005E00B76; Tue, 27 Jun 2017 10:19:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.53 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2C46E00B2F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:19:50 -0700 (PDT)
Received: by mail-lf0-f53.google.com with SMTP id l13so21185057lfl.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TWLbajjBldp+yn+JgZ3wdGVafg6p96E59fD43T+Dxgg=;
	b=VFJQRxUcsH1LjxCpuHmk/0IKlLTRyueJqO5L/SshtJFX3SLLIsHkK4rcEBYizOdPc/
	zy8/jp2X9gazCv89kmAcfjir91lAiy6opycEnajoOfPtMbapjHD7eIK4XSpkPQsEldio
	CLNpiv2MQItq0XB8kSOqm92dD6jFLzkwvsY4V3YDTESqLGXw0omLjX7vhswU/riu9tBD
	ABQbuk/P6X0/JA3WUtcM+Wjtgy6ZvTbMY6nS3fP/UJ6yRn7MVvQNmh4DGtzN/1Dpca46
	EfJpZYB/ve3EFTxFVYoH8+vIfXjz0Tkm9bLa8HCmukXgpknWPEDVCXStQzk3HVisUydG
	MZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TWLbajjBldp+yn+JgZ3wdGVafg6p96E59fD43T+Dxgg=;
	b=FpMg8w2Mm07xAZaWLQe3c0VPcqx+rmVAN00z0jzCoxUk7suE1rXpme2A+a+iomgeHT
	G6Zqj9cDl3ODVmgQLVh+gBB5jCQOfVQxfHpf45LyML/W/9UT+VmY0drCOov1Wc7Ij5j4
	52o6pT32tM7gIn3rBZXLh9qPa3IeBAX169JfETDLhkZP9+w7rWSV9bj6Nrv7IA4Ro2ii
	FD6HnMzZcoWoQOl+PSsjkIUNtBCXcqsqWdhN8xO32prWBtBilRtUPFoMxfgeTygr3AyB
	LpmxCRWCVkh6u0oKyx69PEHtFyedjt/qFhZkZwwEw6DcHqr1JlxzFbnZphXS2M/cpCwe
	gTgw==
X-Gm-Message-State: AKS2vOwrg07wUsvUrDYl+Iml3yAcnSKUZ1yzmJtlQpwCjkNuka7Ua7sZ
	7Qa7XWLZAcCkixQESyKw2ddUlKxrog==
X-Received: by 10.25.27.2 with SMTP id b2mr1890993lfb.24.1498583988975; Tue,
	27 Jun 2017 10:19:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Tue, 27 Jun 2017 10:19:48 -0700 (PDT)
In-Reply-To: <CAPuovEK4Hyt3JYAQKCMKtNrqNrT2=UbP7hZN0RG+YVLw_2Hcrg@mail.gmail.com>
References: <1498468106-8846-1-git-send-email-zhe.he@windriver.com>
	<CAPuovEK4Hyt3JYAQKCMKtNrqNrT2=UbP7hZN0RG+YVLw_2Hcrg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Jun 2017 13:19:48 -0400
Message-ID: <CADkTA4PX_thFnvF+6eUb4-_pEDZhmDWkUMfPH3HEBf_5wmT-hQ@mail.gmail.com>
To: Mark Asselstine <asselsm@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] protobuf protobuf-c: Remove COMPATIBLE_HOST
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
X-List-Received-Date: Tue, 27 Jun 2017 17:19:52 -0000
Content-Type: multipart/alternative; boundary="001a1140244c54412f0552f446e9"

--001a1140244c54412f0552f446e9
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 26, 2017 at 1:57 PM, Mark Asselstine <asselsm@gmail.com> wrote:

> On Mon, Jun 26, 2017 at 5:08 AM,  <zhe.he@windriver.com> wrote:
> > From: He Zhe <zhe.he@windriver.com>
> >
> > protobuf and protobuf-c can actually work with all arches but they were
> > limited and merged upstream by 5e5e09a18199108de29bfee101c7b311ef094d94
> >
> > This patch removes the COMPATIBLE_HOST to re-enable them to work with
> > other architectures.
> >
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
>
> Bruce, I had a look at this and the changes look fine and match what
> is in meta-oe. Let me know if you are still in favour of removing
> these to use the copies in meta-oe, something you have mentioned in
> the past but we have yet to follow through with.
>


I'm going to take the plunge and remove the recipes .. and we'll watch for
any
breakage.

So instead of this patch, I just git rm'd the protobuf recipes and will
push that
instead.

Bruce


>
> Mark
>
> >  recipes-devtools/protobuf/protobuf-c_1.2.1.bb | 2 --
> >  recipes-devtools/protobuf/protobuf_3.1.0.bb   | 2 --
> >  2 files changed, 4 deletions(-)
> >
> > diff --git a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> > index ff2499e..daba0ed 100644
> > --- a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> > +++ b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> > @@ -6,8 +6,6 @@ LICENSE = "Apache-2.0"
> >
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c
> 0e"
> >
> > -COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> > -
> >  DEPENDS = "protobuf protobuf-c-native"
> >
> >  SRC_URI[md5sum] = "e544249c329391fff512c3874895cfbe"
> > diff --git a/recipes-devtools/protobuf/protobuf_3.1.0.bb
> b/recipes-devtools/protobuf/protobuf_3.1.0.bb
> > index 78b0d60..7d6698d 100644
> > --- a/recipes-devtools/protobuf/protobuf_3.1.0.bb
> > +++ b/recipes-devtools/protobuf/protobuf_3.1.0.bb
> > @@ -19,8 +19,6 @@ SRC_URI = "https://github.com/google/
> protobuf/archive/v3.1.0.tar.gz;downloadfile
> >                 file://run-ptest \
> >              "
> >
> > -COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> > -
> >  EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
> >  inherit autotools setuptools ptest
> >
> > --
> > 2.8.1
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1140244c54412f0552f446e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jun 26, 2017 at 1:57 PM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:asselsm@gmail.com" target=3D"_blank">asselsm@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On M=
on, Jun 26, 2017 at 5:08 AM,=C2=A0 &lt;<a href=3D"mailto:zhe.he@windriver.c=
om">zhe.he@windriver.com</a>&gt; wrote:<br>
&gt; From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windri=
ver.com</a>&gt;<br>
&gt;<br>
&gt; protobuf and protobuf-c can actually work with all arches but they wer=
e<br>
&gt; limited and merged upstream by 5e5e09a18199108de29bfee101c7b3<wbr>11ef=
094d94<br>
&gt;<br>
&gt; This patch removes the COMPATIBLE_HOST to re-enable them to work with<=
br>
&gt; other architectures.<br>
&gt;<br>
&gt; Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.=
he@windriver.com</a>&gt;<br>
&gt; ---<br>
<br>
</span>Bruce, I had a look at this and the changes look fine and match what=
<br>
is in meta-oe. Let me know if you are still in favour of removing<br>
these to use the copies in meta-oe, something you have mentioned in<br>
the past but we have yet to follow through with.<br></blockquote><div><br><=
/div><div><br></div><div>I&#39;m going to take the plunge and remove the re=
cipes .. and we&#39;ll watch for any</div><div>breakage.=C2=A0</div><div><b=
r></div><div>So instead of this patch, I just git rm&#39;d the protobuf rec=
ipes and will push that</div><div>instead.</div><div><br></div><div>Bruce</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 recipes-devtools/protobuf/<a href=3D"http://protobuf-c_1.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-c_1.2.1.bb</a> | 2 --<b=
r>
&gt;=C2=A0 recipes-devtools/protobuf/<a href=3D"http://protobuf_3.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">prot<wbr>obuf_3.1.0.bb</a>=C2=A0 =C2=A0=
| 2 --<br>
&gt;=C2=A0 2 files changed, 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-c_1.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-c_1.2.1.bb</a> b=
/recipes-devtools/protobuf/<a href=3D"http://protobuf-c_1.2.1.bb" rel=3D"no=
referrer" target=3D"_blank">pr<wbr>otobuf-c_1.2.1.bb</a><br>
&gt; index ff2499e..daba0ed 100644<br>
&gt; --- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-c_1.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-c_1.2.1.bb</a><br>
&gt; +++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-c_1.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-c_1.2.1.bb</a><br>
&gt; @@ -6,8 +6,6 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>235c3195a39=
68524dc1524b4ebea0c<wbr>0e&quot;<br>
&gt;<br>
&gt; -COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
&gt; -<br>
&gt;=C2=A0 DEPENDS =3D &quot;protobuf protobuf-c-native&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;<wbr>e544249c329391fff512c3874895cf<wb=
r>be&quot;<br>
&gt; diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.1.0.bb</a> b/rec=
ipes-devtools/protobuf/<a href=3D"http://protobuf_3.1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">pr<wbr>otobuf_3.1.0.bb</a><br>
&gt; index 78b0d60..7d6698d 100644<br>
&gt; --- a/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.1.0.bb</a><br>
&gt; +++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.1.0.bb</a><br>
&gt; @@ -19,8 +19,6 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/goog=
le/protobuf/archive/v3.1.0.tar.gz;downloadfile" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.1.0.tar.<wbr=
>gz;downloadfile</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ru=
n-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
&gt; -<br>
&gt;=C2=A0 EXTRA_OECONF +=3D &quot; --with-protoc=3D${STAGING_<wbr>BINDIR_N=
ATIVE}/protoc&quot;<br>
&gt;=C2=A0 inherit autotools setuptools ptest<br>
&gt;<br>
&gt; --<br>
&gt; 2.8.1<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a1140244c54412f0552f446e9--
