Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9923BE0097D; Fri, 10 Feb 2017 13:17:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.177 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.177 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 772CBE00924
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 13:17:23 -0800 (PST)
Received: by mail-qk0-f177.google.com with SMTP id 11so52621231qkl.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 13:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0nbTowe0vV444NCgDjzzcinVKIvALN/oWWIa6YZFER8=;
	b=HFyhSQcfNXjDllJeVFyEko5BGw/SouKMa2zYLzFgohR+SliXI33ppUtJDdiUadBlWX
	Ux+d50I8Jz9erW40gA97gas3blDMkj4AZ8RwewHfea/IwshnTQioRWrplk/PvJkVGq1K
	8jXZRSfMvBCzAPBJbYgWbiXoy4iyCnmW3DDoJ4rk+U9VddnGf31km/Wk8LoltUyU+GsC
	d8nfsywht4wiSWSYOp1ezucSFCWt5y4wccRxYGZNyZFYAbpiQT5PBRp1j4qQV+P7Nja5
	VVw7edGf1wJShcsmdsxCT8GKTqg1fScow4plC/K94qiKPhlawC44dkeQFSk7KdmCcPgf
	EZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0nbTowe0vV444NCgDjzzcinVKIvALN/oWWIa6YZFER8=;
	b=IRyuUKKofWxpZs1B4Ar/Pk4YJl4dwyjHGkDM/0N7vB+Z4Go2wVYzytpNslC95ZS8+Z
	8CZn3o/rFTlzxoRP+IFGY2yH/w7LWZFEpOE3lO6RG4AetHsM4lRw4ExVvhXoJ+9TFlpC
	TB7kmh4tpHMKjsaPboHJZckJOBLa6xSgXbmsox40DDhbbdkN2sndPnbm3e9Hn6nPV2j8
	TocJYSGVhOXCJoVkIOn+vxVo15HEzKre6sDeaqCzuRHPNs4m7ehrc/SkJZnVMIa5oDSd
	UavSXm/7XMvcSHDUQtkNE2rHqeQqFQeSRFlEeWNkMh43YFj0otHkARqONx/HghkpktC0
	+kOA==
X-Gm-Message-State: AMke39mtx1Jzpk+hznJJv0ULFxs1Z02K9L/KmJh2MSxvugV70oFT7LhPzOwtDlrljZoactAT1XXlOErhsBjEFg==
X-Received: by 10.55.22.97 with SMTP id g94mr9998194qkh.287.1486761443002;
	Fri, 10 Feb 2017 13:17:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 10 Feb 2017 13:17:22 -0800 (PST)
In-Reply-To: <91a2ecd5-1f2d-25c4-ee68-972b8920d67c@siemens.com>
References: <91a2ecd5-1f2d-25c4-ee68-972b8920d67c@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Feb 2017 16:17:22 -0500
Message-ID: <CADkTA4NxjSQZi06Dniog3H6U5xPWq+ZP_UeA9Oigxg_L6E-cUA@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] containerd: Fix build on 386
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
X-List-Received-Date: Fri, 10 Feb 2017 21:17:27 -0000
Content-Type: multipart/alternative; boundary=001a114967eaad1d3b0548339f34

--001a114967eaad1d3b0548339f34
Content-Type: text/plain; charset=UTF-8

applied.

Bruce

On Fri, Feb 10, 2017 at 7:14 AM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> Go only understands "386" as target arch, not "i586". Adjust this.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>
> Found while building meta-virtualization for an Intel Quark target.
>
>  recipes-containers/containerd/containerd_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb
> b/recipes-containers/containerd/containerd_git.bb
> index c257355..5b94dde 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -35,6 +35,9 @@ do_compile() {
>         if [ "${TARGET_ARCH}" = "aarch64" ]; then
>                 export GOARCH="arm64"
>         fi
> +       if [ "${TARGET_ARCH}" = "i586" ]; then
> +               export GOARCH="386"
> +       fi
>
>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>         # docker to download its dependencies but rather
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

--001a114967eaad1d3b0548339f34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">applied.<div><br></div><div>Bruce</div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Feb 10, 2017 at 7:14 A=
M, Jan Kiszka <span dir=3D"ltr">&lt;<a href=3D"mailto:jan.kiszka@siemens.co=
m" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Go only understands &quot;386&quot; as target arch=
, not &quot;i586&quot;. Adjust this.<br>
<br>
Signed-off-by: Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan=
.kiszka@siemens.com</a>&gt;<br>
---<br>
<br>
Found while building meta-virtualization for an Intel Quark target.<br>
<br>
=C2=A0recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>containerd_git.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-containers/<wbr>containerd/<a href=3D"http://container=
d_git.bb" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a> b/reci=
pes-containers/<wbr>containerd/<a href=3D"http://containerd_git.bb" rel=3D"=
noreferrer" target=3D"_blank">containerd_git.bb</a><br>
index c257355..5b94dde 100644<br>
--- a/recipes-containers/<wbr>containerd/<a href=3D"http://containerd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
+++ b/recipes-containers/<wbr>containerd/<a href=3D"http://containerd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
@@ -35,6 +35,9 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${TARGET_ARCH}&quot; =3D &quot;aarch=
64&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D&qu=
ot;arm64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; =3D &quot;i586&=
quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&qu=
ot;386&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Set GOPATH. See &#39;PACKAGERS.md&#39;. Don&#=
39;t rely on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # docker to download its dependencies but rathe=
r<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
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

--001a114967eaad1d3b0548339f34--
