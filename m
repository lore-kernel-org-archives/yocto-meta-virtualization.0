Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7C7BE00D8F; Mon,  8 Aug 2016 07:22:41 -0700 (PDT)
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
	*      [209.85.220.194 listed in list.dnswl.org]
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A596E00D1E;
	Mon,  8 Aug 2016 07:22:37 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id x185so13457436qkc.3;
	Mon, 08 Aug 2016 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nvFfJnXuzNcd6nCGi3ZShtUhu5T5+9shQGe8VQtMTUc=;
	b=gWs2lonblfS+Qt1aAn5mGSTaemK9eOvdFWrQVEoUY0GFYwfezOlIdtighId6C/FKNc
	HOQ4PuECXocA5T9VoAZS2tZ7YdH7xbFnmEjlZYooQodcyACL9nIE83Lj5GXEratNPD5i
	7luyqiYl1NtVkpVIZfTdOdS8MA9jwpUmNnvNhu/UV+Z0dwoeMbMNQyCIAOID7yEL3Pbu
	mZo6WAJUm81rsEafq+zMOIbpggndWBhDuPXFuR5lASV1Wh6yETYwFCbN0U1VaE5E4smN
	W9LA8XQa8fR4+aPjhKueg/ZgNGGMA6FqWnqKr7xCU28KMOqnaNSucpJ+5ORWM8PxopXb
	jNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nvFfJnXuzNcd6nCGi3ZShtUhu5T5+9shQGe8VQtMTUc=;
	b=Bp/BRe7LbQejTzwLeY9jmL7IC+UeY0AZovp4v+q9Zchj/vYcC+zFNX5edbtIX131jL
	WLouO1ivKjOTWqmGDW8yFPLcXk5HQHCR9eFJVFxOGoOVyB+xkhzGUMnyIgpyHDPSvCqs
	iC+LBRHNpKBT4dgHTPsCXoNlCqejaGBmB1JXeUbmbDdwWZp5mgAJC7ylVUipwQkX+NSd
	2ISqZnU4VvQVdzpXuH3bqRfZYjGVz0XqOObxGq/OL3JIzUpv3PwAp9KobZBIutNUhhaq
	RZKVAq2OCYk0hyfWJQzYhcJxnJFAJ/IiCDgjsoDRdm47kFBavVWBioBeomiCFpNxcbf4
	5Nww==
X-Gm-Message-State: AEkoouvkCvMzMkpLuUZNg4c9HhKKSnjW1Y1TaRa6i9FL4winsWrxTkIzDEhW425vJcJlLgvTcecGn3AJZ7xT5Q==
X-Received: by 10.55.139.4 with SMTP id n4mr29239648qkd.161.1470666157351;
	Mon, 08 Aug 2016 07:22:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 8 Aug 2016 07:22:36 -0700 (PDT)
In-Reply-To: <20160808023321.7604-1-kai.kang@windriver.com>
References: <20160808023321.7604-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Aug 2016 10:22:36 -0400
Message-ID: <CADkTA4OhawujfzgoCVJWiB9JPs+x+Qz1KkYXutHXn_5ETfeusA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>
Subject: Re: [yocto] [PATCH] Fix build error for arm
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
X-List-Received-Date: Mon, 08 Aug 2016 14:22:41 -0000
Content-Type: multipart/alternative; boundary=001a114f8344e469bc0539902530

--001a114f8344e469bc0539902530
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 7, 2016 at 10:33 PM, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> When build for qemuarm, it fails to do compile_ptest_base.
>
>
Wrong mailing list (use meta-virtualization@yoctoproject.org).

But I've grabbed this and merged it anyway.

Bruce


> Kai Kang (1):
>   libvirt: fix build error for arm
>
>  .../0001-nsslinktest-also-build-virAtomic.h.patch  | 40
> ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.3.5.bb          |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 recipes-extended/libvirt/
> libvirt/0001-nsslinktest-also-build-virAtomic.h.patch
>
> --
> 2.9.2.368.g08bb350
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114f8344e469bc0539902530
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Aug 7, 2016 at 10:33 PM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">From: Kai Kang &lt;<a href=
=3D"mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt;<br>
<br>
When build for qemuarm, it fails to do compile_ptest_base.<br>
<br></blockquote><div><br></div><div>Wrong mailing list (use <a href=3D"mai=
lto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.=
org</a>).<br><br></div><div>But I&#39;ve grabbed this and merged it anyway.=
<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
Kai Kang (1):<br>
=C2=A0 libvirt: fix build error for arm<br>
<br>
=C2=A0.../0001-nsslinktest-also-<wbr>build-virAtomic.h.patch=C2=A0 | 40 +++=
+++++++++++++++++++<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_1.3.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 41 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/<wbr>libvirt/0001-nsslink=
test-also-<wbr>build-virAtomic.h.patch<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.9.2.368.g08bb350<br>
<br>
--<br>
______________________________<wbr>_________________<br>
yocto mailing list<br>
<a href=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/yocto" rel=3D"noreferrer=
" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/yocto</a><=
br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a114f8344e469bc0539902530--
