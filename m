Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9732EE0091A; Tue,  3 Jan 2017 07:29:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.179 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D03BE0049A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jan 2017 07:29:48 -0800 (PST)
Received: by mail-qk0-f179.google.com with SMTP id t184so378437105qkd.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Jan 2017 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yN9UEPNMsJbNuVHCGJdcOdpjMdzNDiG1vBKxvt2IUZE=;
	b=bRFWKldQ0nIqVUpCVYDh9tc8IuclD/M/U8bFQ1vinCnNjvF/Y75yKDAcgabrz9bo01
	kWjsm2iHNdMHSRVwxTf1p5iDArBbfqHhfBIVd2ZvLPhNwAB7ZhK3koFCzEdOusrzTEA6
	k44nC/pYo12va+/uyN+I4g22qAISDfJXO+vcI5BEH1pvNz7Byn/PS8wG5wm1GSRV7v/7
	O/dTbu7qfvv3Lvgo6eJJxRoOtEzuCI3gort2WBAC9fnQVAgp3cfBenUZWmt6imM1v4Zg
	TCkvfnaxGafiSXBH9uHsMU0uhOYi2P2pqW2ly7OjRvfeFezemNtddaeO0j6OWgqHNpUs
	TOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yN9UEPNMsJbNuVHCGJdcOdpjMdzNDiG1vBKxvt2IUZE=;
	b=bXIiNv+RLdTVJjaLziWtTSCsTQZawL5E7uPIUt5tLQEFi3A4NMg2RE1641k1Sz/ukD
	soY0l8jR5XMMPVgtw0gKxNk5jSAnbz5YhCQmKfhWwags8H9uslpi5TkBUOJY3aRtC6gr
	L6oGIzTpsZYoq9516zLhIebjMVYtxgF5ns9ceCJ7wRI1TMfz5HJzZD8QRJpsaPuqRaO/
	JuOMu9/bRVvRVxnQ8aQ9t9c82opQJRwQBGPchShHWASdKybM1Xvc50QcytozjC2TF18C
	vyR95Ty494QoLYaBxcpZcVh64fVwFS+VKk58+JRAMkoz/0xrzgXCjTM/RsQ26uI7PsQE
	BoeQ==
X-Gm-Message-State: AIkVDXIDYjFc7rozBomTJQmQOx8rQ0nQk5rJ2Lp2xsEwSlOmyx7LegGU4d6mGznxFs2l20Xinsc5JLlYhgJHhw==
X-Received: by 10.55.22.97 with SMTP id g94mr59544085qkh.287.1483457388174;
	Tue, 03 Jan 2017 07:29:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Tue, 3 Jan 2017 07:29:47 -0800 (PST)
In-Reply-To: <1483309280-9112-1-git-send-email-paul@paulbarker.me.uk>
References: <1483309280-9112-1-git-send-email-paul@paulbarker.me.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Jan 2017 10:29:47 -0500
Message-ID: <CADkTA4O_6UT-L6nn5JkVPnC0dZi8g2ryy+x=-88Kzn4rXk4H3A@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] go-osarchmap: Skip golang recipes for unsupported architectures
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
X-List-Received-Date: Tue, 03 Jan 2017 15:29:50 -0000
Content-Type: multipart/alternative; boundary=001a114967eaa9636505453256ee

--001a114967eaa9636505453256ee
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Sun, Jan 1, 2017 at 5:21 PM, Paul Barker <paul@paulbarker.me.uk> wrote:

> Building any recipe for a mips-based machine like arduino-yun currently
> leads
> to errors in go_map_arch(). Instead, errors should only be raised if a
> recipe
> which uses golang is built. This is achieved using the same error handling
> seen
> in recipes-extended/xen.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  classes/go-osarchmap.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass
> index 4e00c7b..303b30b 100644
> --- a/classes/go-osarchmap.bbclass
> +++ b/classes/go-osarchmap.bbclass
> @@ -11,6 +11,11 @@ TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH',
> True), d.getVar('TUNE_FEAT
>  TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
>  GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','
> bin'][d.getVar('BUILD_GOTUPLE',True) == d.getVar('HOST_GOTUPLE',True)]}"
>
> +python() {
> +    if d.getVar('TARGET_GOARCH') == 'INVALID':
> +        raise bb.parse.SkipPackage('Cannot map `%s` to a go architecture'
> % d.getVar('TARGET_ARCH', True))
> +}
> +
>  def go_map_arch(a, d):
>      import re
>      if re.match('i.86', a):
> @@ -24,7 +29,7 @@ def go_map_arch(a, d):
>      elif re.match('p(pc|owerpc)(|64)', a):
>          return 'powerpc'
>      else:
> -        bb.error("cannot map '%s' to a Go architecture" % a)
> +        return 'INVALID'
>
>  def go_map_arm(a, f, d):
>      import re
> --
> 2.1.4
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

--001a114967eaa9636505453256ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged to master.<div><br></div><div>Bruce</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Jan 1, 2017 a=
t 5:21 PM, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mailto:paul@paulbar=
ker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Building any recipe for a mips-based machin=
e like arduino-yun currently leads<br>
to errors in go_map_arch(). Instead, errors should only be raised if a reci=
pe<br>
which uses golang is built. This is achieved using the same error handling =
seen<br>
in recipes-extended/xen.<br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">pau=
l@paulbarker.me.uk</a>&gt;<br>
---<br>
=C2=A0classes/go-osarchmap.bbclass | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass<br=
>
index 4e00c7b..303b30b 100644<br>
--- a/classes/go-osarchmap.bbclass<br>
+++ b/classes/go-osarchmap.bbclass<br>
@@ -11,6 +11,11 @@ TARGET_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;<wbr>=
TARGET_ARCH&#39;, True), d.getVar(&#39;TUNE_FEAT<br>
=C2=A0TARGET_GOTUPLE =3D &quot;${TARGET_GOOS}_${TARGET_<wbr>GOARCH}&quot;<b=
r>
=C2=A0GO_BUILD_BINDIR =3D &quot;${@[&#39;bin/${HOST_GOTUPLE}&#39;,&#39;<wbr=
>bin&#39;][d.getVar(&#39;BUILD_GOTUPLE&#39;<wbr>,True) =3D=3D d.getVar(&#39=
;HOST_GOTUPLE&#39;,True)]<wbr>}&quot;<br>
<br>
+python() {<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;TARGET_GOARCH&#39;) =3D=3D &#39;INVALID&#39=
;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&#39;Cannot map `%s=
` to a go architecture&#39; % d.getVar(&#39;TARGET_ARCH&#39;, True))<br>
+}<br>
+<br>
=C2=A0def go_map_arch(a, d):<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
=C2=A0 =C2=A0 =C2=A0if re.match(&#39;i.86&#39;, a):<br>
@@ -24,7 +29,7 @@ def go_map_arch(a, d):<br>
=C2=A0 =C2=A0 =C2=A0elif re.match(&#39;p(pc|owerpc)(|64)&#39;, a):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;powerpc&#39;<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;cannot map &#39;%s&#39; to a Go=
 architecture&quot; % a)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;INVALID&#39;<br>
<br>
=C2=A0def go_map_arm(a, f, d):<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a114967eaa9636505453256ee--
