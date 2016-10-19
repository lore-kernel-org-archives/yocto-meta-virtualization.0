Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C61D6E006D8; Wed, 19 Oct 2016 09:38:37 -0700 (PDT)
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
	*      [209.85.220.173 listed in list.dnswl.org]
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BDFCE002AC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Oct 2016 09:38:33 -0700 (PDT)
Received: by mail-qk0-f173.google.com with SMTP id f128so43023748qkb.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Oct 2016 09:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ilSwWYgBxKKmnqnzB5BhZD/uOK0PcIVJ4O2XiY4UJtw=;
	b=lH6t1r3z+YGb07I/uyxPFtf67V/iKnWD/27LIkpehppg0HRZREoUhQP0zHq0ENkvto
	jlgXQG4zaLpt7O1yK93YHMW4dW+y6tu4Xg/kopaEKnwhG/QkS5RBnIG3e88dDde4Mw+P
	Mbin1SX+VpnguMf4KQx4SJP30xbSnuaSdBVgnxgcLXQs75X6GzM78ATj+nTbJqhZ0lKc
	RX1JIfwSxx9/HkEHYhU9EqCyPokT/7MqokWlUrHCmkR0jTjydnm8BPyoINLnceZCIA8j
	/qlVbwFKBGROZkEhUVApboy7cp3sNdN9lMLRGEv87JRjpqzqLSuKsK28OEDJ7dkRcJnD
	vGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ilSwWYgBxKKmnqnzB5BhZD/uOK0PcIVJ4O2XiY4UJtw=;
	b=CWt7LOgxC+5waO03JVPCRWVIMbL5fep/0BeB6rstNO9Bawi/tAnrT5nGeZ2fb0Vz26
	qy/pdNCetTfsr6J8iRGRo7A/+otDrFPZp79HivB/A1y7WmIR+7CH1auXipGI1EcASivL
	9TbzAzkvu942sV08bKlbneNMs2huLro9GH2YWtuuPvDmIRg6f4zTtsB50UVdSjPq+gjg
	akoCJbg7ho5ejgKS63aq8gqawlkAgmfZQRrtOoFCa7lOehlMUxoI75qJ78zPRthk3yJP
	kXFhMj6PvNg+oE5eHH9wzppoIA89/sxpts3uId80+oiIzx7RkIJeoqk47kBM5yaK13w3
	tjYQ==
X-Gm-Message-State: AA6/9RmuwFSKhv9CL2sXvZbeot++C+iElbhUYaAlO1YCWBn0Ny6fxjciCGhStpPlir9TBMAHULO7VmldhMPjkA==
X-Received: by 10.55.60.13 with SMTP id j13mr6831002qka.113.1476895112595;
	Wed, 19 Oct 2016 09:38:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Wed, 19 Oct 2016 09:38:32 -0700 (PDT)
In-Reply-To: <1476821516-26732-1-git-send-email-jason.wessel@windriver.com>
References: <1476821516-26732-1-git-send-email-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Oct 2016 12:38:32 -0400
Message-ID: <CADkTA4PyK553oyULWNPxmSFgEeFimPjUs43QeQLjMqYS5vjq1Q@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] go-native: Add work around for binutils >= 2.27
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
X-List-Received-Date: Wed, 19 Oct 2016 16:38:37 -0000
Content-Type: multipart/alternative; boundary=001a114a15a28e9fb3053f3a7044

--001a114a15a28e9fb3053f3a7044
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Oct 18, 2016 at 4:11 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> We only use go-native to bootstrap go-cross and according to a post in
> the go-lang git it is possible to work around by disabling CGO:
>
> https://github.com/golang/go/issues/16906
>
> This patch fixes the compile failure with binutils 2.27 which has the
> message:
>
> cannot load DWARF output from $WORK/net/_obj//_cgo_.o: decoding dwarf
> section info at offset 0x4: unsupported version 0
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-devtools/go-cross/go-native.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go-cross/go-native.inc
> b/recipes-devtools/go-cross/go-native.inc
> index 8b4be9e..cb2dd2a 100644
> --- a/recipes-devtools/go-cross/go-native.inc
> +++ b/recipes-devtools/go-cross/go-native.inc
> @@ -16,7 +16,7 @@ do_compile() {
>      mkdir -p ${WORKDIR}/build-tmp
>
>      cd src
> -    ./make.bash --host-only
> +    CGO_ENABLED=0 ./make.bash --host-only
>  }
>
>
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

--001a114a15a28e9fb3053f3a7044
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Tue, Oct 18, 2016 at 4:11 PM, J=
ason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windriver.=
com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">We only use go-native to bootstrap go-cross =
and according to a post in<br>
the go-lang git it is possible to work around by disabling CGO:<br>
<br>
<a href=3D"https://github.com/golang/go/issues/16906" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/golang/go/<wbr>issues/16906</a><br>
<br>
This patch fixes the compile failure with binutils 2.27 which has the<br>
message:<br>
<br>
cannot load DWARF output from $WORK/net/_obj//_cgo_.o: decoding dwarf secti=
on info at offset 0x4: unsupported version 0<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/go-cross/go-<wbr>native.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-devtools/go-cross/<wbr>go-native.inc b/recipes-devtool=
s/go-cross/<wbr>go-native.inc<br>
index 8b4be9e..cb2dd2a 100644<br>
--- a/recipes-devtools/go-cross/<wbr>go-native.inc<br>
+++ b/recipes-devtools/go-cross/<wbr>go-native.inc<br>
@@ -16,7 +16,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/build-tmp<br>
<br>
=C2=A0 =C2=A0 =C2=A0cd src<br>
-=C2=A0 =C2=A0 ./make.bash --host-only<br>
+=C2=A0 =C2=A0 CGO_ENABLED=3D0 ./make.bash --host-only<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a114a15a28e9fb3053f3a7044--
