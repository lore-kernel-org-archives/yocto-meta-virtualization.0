Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CB32E00655; Tue, 21 Mar 2017 14:09:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3483AE003E1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 14:09:46 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id j127so23813258qke.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cD//VZ+9NCGt08XKhMpSbB/q30RpMmo5/SRnUjElvu0=;
	b=WA17uGO11xY62Kz4Xj9JEmBHW4/47C5HYkH5BMnNrr78FZrtzatni9v4MbTQa3OujA
	0Ojhy9fmmVnDuW8leUwzODXjwNRDRsp14soXQxV33gTsAYx+u8Py1CZt4q/qQEnE62B8
	EO6U0fy/0WT3aLEHVMi7di137nzBhScXf/yJNwlDkZ0VfTqpNrmLgQXq8QvjPm+rBTWq
	FgV0Tr/XmttxIGTQs0ysUJcZ1iryo3h6A7HIa5F45Bjo0ph1x/xvUdRKi4IHeOarY7EI
	D6BMHG5Oms0lgtt+zFHtGG92cFicLd1gHEdRkrDE/VadYqHm7y6NAxb3mYA1fLW6azD6
	Xqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cD//VZ+9NCGt08XKhMpSbB/q30RpMmo5/SRnUjElvu0=;
	b=CaC35CEVD1ZeHxekUiAiZ5lpwQHcd4yvpLhqk5xjB1BDxl+gkixcOOPqCVym7r2cD8
	IKtYGIRQvjZbMXYQ5v7KpSMy2PBIMrFindK7ENQZgmNYHR3OeTOxin53phu868YanyvU
	QQZQCIEk0b39Nd/nLr83MTygKsYbluZNG8rFNQbt1B7Fn2+x1aWBnoyfBTbHt5eu40vK
	cck+xx0v6/Y1YAIRqHCcZe9iCb0vrvm90mzWCOX3Q0l54Bc7Z6gVM7AdEaJX02mV2Wi+
	J89rgh5BuHOeW9dqDUQHrPexrRE4hSnP14z+1q2A3ah9MojnaEasDKEL4Wr2xlouYk9u
	fjYg==
X-Gm-Message-State: AFeK/H27dJWx1WbNG7isNwBCfQ+KNReRg6kWnGNn0jIPd0fh3CIuLVOnwf/PUB7MmKvY0MDlVXniNEgpbAGGwg==
X-Received: by 10.55.200.90 with SMTP id c87mr21868145qkj.287.1490130586091;
	Tue, 21 Mar 2017 14:09:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Tue, 21 Mar 2017 14:09:45 -0700 (PDT)
In-Reply-To: <20170321153612.26114-1-raj.khem@gmail.com>
References: <20170321153612.26114-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2017 17:09:45 -0400
Message-ID: <CADkTA4Psi1VSkJDx5uNTHQ42n0oDapCfxUHRY8i8LgELAa8_0g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[PATCH 1/3] protobuf-native: Enable shared libs
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
X-List-Received-Date: Tue, 21 Mar 2017 21:09:48 -0000
Content-Type: multipart/alternative; boundary=001a1139d71041036e054b44107d

--001a1139d71041036e054b44107d
Content-Type: text/plain; charset=UTF-8

Thanks.

Everything passed my runtime tests, so I've pushed master-next -> master.

Bruce

On Tue, Mar 21, 2017 at 11:36 AM, Khem Raj <raj.khem@gmail.com> wrote:

> protobuf-c needs shared libraries, linking with static libs
> ends up with undefined symbols
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-devtools/protobuf/protobuf-native_3.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> index 47fb401..91ab0b3 100644
> --- a/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> +++ b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "0a0ae63cbffc274efb573bdde9a253
> e3f32e458c41261df51c5dbc5ad5
>  SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.
> gz;downloadfilename=protobuf-3.1.0.tar.gz \
>         "
>
> -EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> +EXTRA_OECONF += " --with-protoc=echo"
>
>  inherit native autotools
>
> --
> 2.12.0
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1139d71041036e054b44107d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks.<div><br></div><div>Everything passed my runtime te=
sts, so I&#39;ve pushed master-next -&gt; master.</div><div><br></div><div>=
Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Mar 21, 2017 at 11:36 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">protobuf-c needs shared libra=
ries, linking with static libs<br>
ends up with undefined symbols<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-native_3.1.0.bb</a> | 2=
 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb<=
/a> b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br>
index 47fb401..91ab0b3 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D &quot;<wbr>0a0ae63cbffc274efb573bd=
de9a253<wbr>e3f32e458c41261df51c5dbc5ad5<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archi=
ve/v3.1.0.tar.gz;downloadfilename=3Dprotobuf-3.1.0.tar.gz" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.1.0=
.tar.<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.1.0.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<br>
+EXTRA_OECONF +=3D &quot; --with-protoc=3Decho&quot;<br>
<br>
=C2=A0inherit native autotools<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.12.0<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a1139d71041036e054b44107d--
