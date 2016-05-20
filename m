Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7AD9E00D23; Fri, 20 May 2016 09:34:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25C4BE00CE1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:34:28 -0700 (PDT)
Received: by mail-oi0-f68.google.com with SMTP id w198so24943492oiw.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=iE8u9InGPcKd/kpxLMP+RzHUvBLHmouCp1nsodAd/Qg=;
	b=ideCN0MeDBh8sRSo4Eq9mmYNN3XeIQgDNSS2oPpl5qGeS9E+wk0LycXaWNFcRkVYDA
	nuf3AT3g/1U9g7+DOV/XGPK+Hh3OHQYiTw+u0k3KUwXou2km8SoXXb12HFMYnuEv9otq
	pz6MLpndCH3WFMO0+cSO9ixJGqvpR96KzEMPGgkelzyq2MWHN+6t0rHMSFMKpmsfwHWJ
	w+AD7b+0pruNtLOQNQWKbKqFqJOCj1otw0OqcBM/hfIo3X590mGnxf0T++ajFx6mIl+6
	BNHnDH0JxoHgdxcPUH10b6Vdl8Ll+21dpWatF4jkUmJAqNCHQiiBupBXrHdmteROQTli
	WHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=iE8u9InGPcKd/kpxLMP+RzHUvBLHmouCp1nsodAd/Qg=;
	b=Hebx0IO6w/gtFdvLLVLe29a/ons0hK0ACPHzNVP/vo6eVHWSG5Cj+CObClYms0kojr
	Z0Y8UsKIRk6yeMlT4tl+QNjqEq8Y69uvAcUWR2bIdlDgkFNbPK5Dbyc4mmdgLdgvN0Ux
	A7sCysoOAtWGmXSScUfRioW/lJQDTGNdRTLhrH/s6OCcZSxIuYPHh2jkOhNI+7uf6UAn
	CyoFxTQUuKOB+fIEMxhviqt4MRoXuSu1tR/I2l1hk4of5YT2oZn29UcS2iAvejj5kUN9
	znBFDmr5BXgCKGsUFiqzWTv9oi/qoe2jRkfbOorTtNEjgurqcMBtxUgW3e80nQktk7Ao
	hN2g==
X-Gm-Message-State: AOPr4FXpb5CSdi5Hit8j9Ff2GXWOW8YDtV+caUvqivsBOihGMe3WiyJGmOtr4vThoJe71eASRr2sHZzlCGdg6A==
MIME-Version: 1.0
X-Received: by 10.157.2.69 with SMTP id 63mr2472739otb.159.1463762067459; Fri,
	20 May 2016 09:34:27 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Fri, 20 May 2016 09:34:27 -0700 (PDT)
In-Reply-To: <1463756111-12340-1-git-send-email-mark.asselstine@windriver.com>
References: <1463756111-12340-1-git-send-email-mark.asselstine@windriver.com>
Date: Fri, 20 May 2016 12:34:27 -0400
Message-ID: <CADkTA4NZaPQfpSTAxSOJ8fhujCcjYBieFYmoEAmswUcGET1OZA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] go-native: don't use host /var/tmp for temp build artifacts
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
X-List-Received-Date: Fri, 20 May 2016 16:34:30 -0000
Content-Type: multipart/alternative; boundary=94eb2c114d241118fd053348aa75

--94eb2c114d241118fd053348aa75
Content-Type: text/plain; charset=UTF-8

 merged.

Bruce

On Fri, May 20, 2016 at 10:55 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Similar to a recent change for go-cross we can potentially run in to a
> build failure:
>
>   go tool dist: mkdtemp(/var/tmp/go-cbuild-A0rrP5): No such file or
> directory
>
> when the host doesn't have a /var/tmp or when the permissions don't
> allow for the creation of the temporary directory. Instead of relying
> on /var/tmp we create and use a temporary directory in the $WORKDIR to
> work around this issue. This is passed to the build via the TMPDIR
> environment variable.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/go-cross/go-native.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-devtools/go-cross/go-native.inc
> b/recipes-devtools/go-cross/go-native.inc
> index ae3dc83..e431b48 100644
> --- a/recipes-devtools/go-cross/go-native.inc
> +++ b/recipes-devtools/go-cross/go-native.inc
> @@ -11,6 +11,10 @@ do_compile() {
>      export GOBIN="${B}/bin"
>      rm -rf ${GOBIN}
>      mkdir ${GOBIN}
> +
> +    export TMPDIR=${WORKDIR}/build-tmp
> +    mkdir ${WORKDIR}/build-tmp
> +
>      cd src
>      ./make.bash --host-only
>  }
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

--94eb2c114d241118fd053348aa75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0merged.<div><br></div><div>Bruce</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, May 20, 2016 at 1=
0:55 AM, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.assel=
stine@windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Similar to a recent chang=
e for go-cross we can potentially run in to a<br>
build failure:<br>
<br>
=C2=A0 go tool dist: mkdtemp(/var/tmp/go-cbuild-A0rrP5): No such file or di=
rectory<br>
<br>
when the host doesn&#39;t have a /var/tmp or when the permissions don&#39;t=
<br>
allow for the creation of the temporary directory. Instead of relying<br>
on /var/tmp we create and use a temporary directory in the $WORKDIR to<br>
work around this issue. This is passed to the build via the TMPDIR<br>
environment variable.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/go-cross/go-native.inc | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/recipes-devtools/go-cross/go-native.inc b/recipes-devtools/go-=
cross/go-native.inc<br>
index ae3dc83..e431b48 100644<br>
--- a/recipes-devtools/go-cross/go-native.inc<br>
+++ b/recipes-devtools/go-cross/go-native.inc<br>
@@ -11,6 +11,10 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0export GOBIN=3D&quot;${B}/bin&quot;<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${GOBIN}<br>
=C2=A0 =C2=A0 =C2=A0mkdir ${GOBIN}<br>
+<br>
+=C2=A0 =C2=A0 export TMPDIR=3D${WORKDIR}/build-tmp<br>
+=C2=A0 =C2=A0 mkdir ${WORKDIR}/build-tmp<br>
+<br>
=C2=A0 =C2=A0 =C2=A0cd src<br>
=C2=A0 =C2=A0 =C2=A0./make.bash --host-only<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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
</div>

--94eb2c114d241118fd053348aa75--
