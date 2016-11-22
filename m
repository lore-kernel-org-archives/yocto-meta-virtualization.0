Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85D9DE00CAE; Tue, 22 Nov 2016 08:27:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.193 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A095E00C45
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 08:27:06 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id n204so5029662qke.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 08:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oc6PoZKW/Re/r2hjCKA3kNTvtZGnkUHmvAF/XwktjWU=;
	b=Pftq+64r1z+8dZyi72LPjCB6pDs0CPiW9OG5IqS8P4b7Sbb1vy9FIU3edzgJhRFo1M
	6+k6wmGYsb0Vo87WbCpXRTVytGQ20PKG7d2MSpHh/0eFSOArFT2ZA+xo2oXTxx2rFtnM
	/+j+qf4N7N0Ef6/DRIqvkIQiivEzrmHTKde2jvNqH8O84vAmx7swxhcX+qt+eUfRH89W
	zneaDpNgPLcVnukLOOKBrm9z+UdFZQb2yOENiCuupFWsUREVjm5WT/ifjuX2pBKoQLl1
	TWe+4nq1sgvJHskreRz1+ufYrlhL07d/c6cYAmnQfjtRqldPhOCJDDgjIi0vW5HisN6A
	ofgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oc6PoZKW/Re/r2hjCKA3kNTvtZGnkUHmvAF/XwktjWU=;
	b=BpDNFmgyTa6pwpBrhKUeMnufqMSue49XVRN8f3dK1faDN8NZdHHHLKXM99XdVWXxcP
	ZK0gcRaFKnWPrbIsQp+1as8XWTzLF/2QEtR1AqC4Ys+7/DdlekTJt0ho0mbwrbVisDlT
	InNIhkOBS842e2JhzwE+89H6JLfLs0TUpGWxIfcSeOhjDyyQVoqH8VE3hq4FQNemxb0N
	FNT59ZMa5FgAvcMrPHb07BWKIWWOgpIY9PFNCR+tevjDPllxv8zJisqA1z6BRMMiIt2E
	OvB/1Q4edrHu036UFzyyL9gRaVbD1FwyG26T+AmGKR3h8UYnQG9/ZuJnST+ylOiXSXof
	mkHA==
X-Gm-Message-State: AKaTC01DjrS/xbjNWrA1xIjdwVduaWXIaPm+PLdldg+4lDcO/KNzIvxht++t/IqgBQnvF75qquEoJCc+iU5cKw==
X-Received: by 10.55.166.77 with SMTP id p74mr22649146qke.113.1479832026139;
	Tue, 22 Nov 2016 08:27:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Tue, 22 Nov 2016 08:27:04 -0800 (PST)
In-Reply-To: <1479804084-192343-1-git-send-email-wenzong.fan@windriver.com>
References: <1479804084-192343-1-git-send-email-wenzong.fan@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Nov 2016 11:27:04 -0500
Message-ID: <CADkTA4NZY9acNXDBr=O7i-=hB2j4VNKtcqipegksD=bQjHyMfA@mail.gmail.com>
To: wenzong.fan@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] protobuf: uprev 3.1.0 from 3.0.0
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
X-List-Received-Date: Tue, 22 Nov 2016 16:27:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c06ed9a3edbab0541e63eb7

--94eb2c06ed9a3edbab0541e63eb7
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2016 at 3:41 AM, <wenzong.fan@windriver.com> wrote:

> From: Wenzong Fan <wenzong.fan@windriver.com>
>
>
I'm trying to eventually drop protobuf from meta-virt in favour of the
meta-oe
variant .. but I haven't gotten around to testing it yet.

So I've taken this change.

If anyone else is building/using protobuf* and can confirm that the meta-oe
recipes work as drop in .. let me know and I can drop these.

Bruce


> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../protobuf/{protobuf-native_3.0.0.bb => protobuf-native_3.1.0.bb} | 6
> +++---
>  recipes-devtools/protobuf/{protobuf_3.0.0.bb => protobuf_3.1.0.bb}  | 6
> +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename recipes-devtools/protobuf/{protobuf-native_3.0.0.bb =>
> protobuf-native_3.1.0.bb} (66%)
>  rename recipes-devtools/protobuf/{protobuf_3.0.0.bb => protobuf_3.1.0.bb}
> (91%)
>
> diff --git a/recipes-devtools/protobuf/protobuf-native_3.0.0.bb
> b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> similarity index 66%
> rename from recipes-devtools/protobuf/protobuf-native_3.0.0.bb
> rename to recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> index 33467b3..47fb401 100644
> --- a/recipes-devtools/protobuf/protobuf-native_3.0.0.bb
> +++ b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 35953c752efc9299b184f91bef540095"
>
>  PR = "r0"
>
> -SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
> -SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082
> e8fc3bda50038ac3dff787650795734146"
> -SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.
> gz;downloadfilename=protobuf-3.0.0.tar.gz \
> +SRC_URI[md5sum] = "14a532a7538551d5def317bfca41dace"
> +SRC_URI[sha256sum] = "0a0ae63cbffc274efb573bdde9a253
> e3f32e458c41261df51c5dbc5ad541e8f7"
> +SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.
> gz;downloadfilename=protobuf-3.1.0.tar.gz \
>         "
>
>  EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> diff --git a/recipes-devtools/protobuf/protobuf_3.0.0.bb
> b/recipes-devtools/protobuf/protobuf_3.1.0.bb
> similarity index 91%
> rename from recipes-devtools/protobuf/protobuf_3.0.0.bb
> rename to recipes-devtools/protobuf/protobuf_3.1.0.bb
> index fd81fe7..b948e66 100644
> --- a/recipes-devtools/protobuf/protobuf_3.0.0.bb
> +++ b/recipes-devtools/protobuf/protobuf_3.1.0.bb
> @@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 35953c752efc9299b184f91bef540095"
>  PR = "r0"
>  EXCLUDE_FROM_WORLD = "1"
>
> -SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
> -SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082
> e8fc3bda50038ac3dff787650795734146"
> -SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.
> gz;downloadfilename=protobuf-3.0.0.tar.gz\
> +SRC_URI[md5sum] = "14a532a7538551d5def317bfca41dace"
> +SRC_URI[sha256sum] = "0a0ae63cbffc274efb573bdde9a253
> e3f32e458c41261df51c5dbc5ad541e8f7"
> +SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.
> gz;downloadfilename=protobuf-3.1.0.tar.gz\
>                 file://protobuf-allow-running-
> python-scripts-from-anywhere.patch \
>                 file://run-ptest \
>              "
> --
> 2.8.1
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

--94eb2c06ed9a3edbab0541e63eb7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 22, 2016 at 3:41 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:wenzong.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Wenzong Fan &l=
t;<a href=3D"mailto:wenzong.fan@windriver.com">wenzong.fan@windriver.com</a=
>&gt;<br>
<br></blockquote><div><br></div><div>I&#39;m trying to eventually drop prot=
obuf from meta-virt in favour of the meta-oe <br></div><div>variant .. but =
I haven&#39;t gotten around to testing it yet.<br><br></div><div>So I&#39;v=
e taken this change.<br><br></div><div>If anyone else is building/using pro=
tobuf* and can confirm that the meta-oe<br></div><div>recipes work as drop =
in .. let me know and I can drop these.<br><br></div><div>Bruce<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Wenzong Fan &lt;<a href=3D"mailto:wenzong.fan@windriver.com"=
>wenzong.fan@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../protobuf/{<a href=3D"http://protobuf-native_3.0.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">protobuf-native_<wbr>3.0.0.bb</a> =3D&gt; <a href=
=3D"http://protobuf-native_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
rotobuf-native_3.1.0.bb</a>} | 6 +++---<br>
=C2=A0recipes-devtools/protobuf/{<a href=3D"http://protobuf_3.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">pro<wbr>tobuf_3.0.0.bb</a> =3D&gt; <a hre=
f=3D"http://protobuf_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">protobu=
f_3.1.0.bb</a>}=C2=A0 | 6 +++---<br>
=C2=A02 files changed, 6 insertions(+), 6 deletions(-)<br>
=C2=A0rename recipes-devtools/protobuf/{<a href=3D"http://protobuf-native_3=
.0.0.bb" rel=3D"noreferrer" target=3D"_blank">pro<wbr>tobuf-native_3.0.0.bb=
</a> =3D&gt; <a href=3D"http://protobuf-native_3.1.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">protobuf-native_3.1.0.bb</a>} (66%)<br>
=C2=A0rename recipes-devtools/protobuf/{<a href=3D"http://protobuf_3.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank">pro<wbr>tobuf_3.0.0.bb</a> =3D&gt; <=
a href=3D"http://protobuf_3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pr=
otobuf_3.1.0.bb</a>} (91%)<br>
<br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.0.0.bb<=
/a> b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br>
similarity index 66%<br>
rename from recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-native_3.0.0.bb</=
a><br>
rename to recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-native_3.1.0.bb</a>=
<br>
index 33467b3..47fb401 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.0.0.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br>
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>3595=
3c752efc9299b184f91bef5400<wbr>95&quot;<br>
<br>
=C2=A0PR =3D &quot;r0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>d4f6ca65aadc6310b3872ee421e79f<wbr>a6&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>f5b3563f118f1d3d6e001705fa7082<wbr>e8fc3=
bda50038ac3dff78765079573<wbr>4146&quot;<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v3=
.0.0.tar.gz;downloadfilename=3Dprotobuf-3.0.0.tar.gz" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.0.0.tar.=
<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.0.0.tar.gz</a> \<br>
+SRC_URI[md5sum] =3D &quot;<wbr>14a532a7538551d5def317bfca41da<wbr>ce&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>0a0ae63cbffc274efb573bdde9a253<wbr>e3f32=
e458c41261df51c5dbc5ad541<wbr>e8f7&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v3=
.1.0.tar.gz;downloadfilename=3Dprotobuf-3.1.0.tar.gz" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.1.0.tar.=
<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.1.0.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<=
br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a> b/recipes-=
devtools/protobuf/<a href=3D"http://protobuf_3.1.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">pr<wbr>otobuf_3.1.0.bb</a><br>
similarity index 91%<br>
rename from recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf_3.0.0.bb</a><br>
rename to recipes-devtools/protobuf/<a href=3D"http://protobuf_3.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">prot<wbr>obuf_3.1.0.bb</a><br>
index fd81fe7..b948e66 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.1.0.bb</a><br>
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>3595=
3c752efc9299b184f91bef5400<wbr>95&quot;<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>d4f6ca65aadc6310b3872ee421e79f<wbr>a6&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>f5b3563f118f1d3d6e001705fa7082<wbr>e8fc3=
bda50038ac3dff78765079573<wbr>4146&quot;<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v3=
.0.0.tar.gz;downloadfilename=3Dprotobuf-3.0.0.tar.gz\
+SRC_URI[md5sum" rel=3D"noreferrer" target=3D"_blank">https://github.com/go=
ogle/<wbr>protobuf/archive/v3.0.0.tar.<wbr>gz;downloadfilename=3Dprotobuf-<=
wbr>3.0.0.tar.gz\<br>
+SRC_URI[md5sum</a>] =3D &quot;<wbr>14a532a7538551d5def317bfca41da<wbr>ce&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>0a0ae63cbffc274efb573bdde9a253<wbr>e3f32=
e458c41261df51c5dbc5ad541<wbr>e8f7&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v3=
.1.0.tar.gz;downloadfilename=3Dprotobuf-3.1.0.tar.gz\" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.1.0.tar=
.<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.1.0.tar.gz\</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://protobuf-all=
ow-running-<wbr>python-scripts-from-anywhere.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
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
</div></div>

--94eb2c06ed9a3edbab0541e63eb7--
