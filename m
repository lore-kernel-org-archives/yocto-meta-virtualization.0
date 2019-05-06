Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96C80E00BAA; Mon,  6 May 2019 12:49:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02BE6E00ADB
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 May 2019 12:49:16 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id f23so12201069ljc.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 May 2019 12:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lzCsQXfGPG6fdJ2+AeUYhkfMG2JBY2z6QlkWLKsj6IY=;
	b=qlR5NZTyWxdxJKd9cUbhQ0F2Mcr08WKf5U8YrAFtvjCXClINH6XuZ7sEy5J6Myl2E8
	AH07VrL9DcNK4tX6ZSPdMpMNV5xlovoFCGk/QWZ/xt5azIWLSdQcKaUW5qRChZvJltkV
	eZ82LstWOQAZp7glDNf/RsY3INHM9OQGQ6/vv/2P40nNldt41CjfLUCItHptG7krmqfZ
	2O5IE77NAptxyOuVg7tIor4Td9k5HADiLHWWp9Gri+KfRxWl4dFvX02PKB49ZqxSElI+
	s/ey1VStbbdWhw0dgSA/KLLptlJZRJ76lYbfh5XheQl2J9eELronp+P+LEez5ya8Gmk3
	vpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lzCsQXfGPG6fdJ2+AeUYhkfMG2JBY2z6QlkWLKsj6IY=;
	b=sri01BNtVNCKna1FcXiz4rCd/rIJkgIL5iU9Px3LWGB0kPD5j4Wi4kGrrxT6Afn+o2
	QDPCRiPcNHKulsgs+GDt1qfVuxu1dJsk8+Xuz3CXsqF9xEnyq2v73lxbc8TuMcv1LPZm
	l9m0mnp2yk71XvCWx2wRC6dARcOaQO8SbsmYm7YM1jADvEIbzH14anF7xm4QlYWajNhk
	Mip8UYbo/eQPGwRiu0LVTwLifZNU6hg/0AwaK+AjOHxzc7dLrZAHM9R7AkNBPQ8WG6RR
	5/n/DqjLUzojqeWvWZTjVey5LqIFBCs9WGE+kjRylKLGuVzdeBBM/KLOKky+DKFhHrVu
	OPHg==
X-Gm-Message-State: APjAAAU5eycaP4uC+9WrEl5j3mN830cWoB3zNdTiapveGMb3u/434YWh
	dkTr7T/cqXRKEFxGrlXLKcQr+eQ6WL9osLwWdnw=
X-Google-Smtp-Source: APXvYqwG0Q1QtA7KfGlxnKZsRa+RHd/hFvNxm2sGfnsoxdX104d4zSGmfPXhf0JunWja0blKPNHZRohDmQjRl4QiRKw=
X-Received: by 2002:a2e:96d9:: with SMTP id d25mr14057966ljj.78.1557172155827; 
	Mon, 06 May 2019 12:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190506021718.128811-1-kai.kang@windriver.com>
In-Reply-To: <20190506021718.128811-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 May 2019 15:49:04 -0400
Message-ID: <CADkTA4PJwC-UD5E3w7yQiEuoHo6=F9GqFbshEc3pDyZscJBeNA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH v2 0/3] Fix dependency issues for librdmacm and glusterfs
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
X-List-Received-Date: Mon, 06 May 2019 19:49:17 -0000
Content-Type: multipart/alternative; boundary="00000000000033c9a705883d655e"

--00000000000033c9a705883d655e
Content-Type: text/plain; charset="UTF-8"

On Sun, May 5, 2019 at 10:17 PM <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Re-send v2:
> * Maybe wrong recipient in previous v2 thread, Bruce didn't recieve the
> 3rd patch. So re-send.
>

thanks. I got all three this time.

They are now merged.

Bruce



>
> Kai Kang (3):
>   glusterfs: remove PACKAGECONFIG libibverbs for arm 32 and mips
>   librdmacm: set imcompatible with arm 32 and mips arches
>   layer.conf: depends on meta-filesystems
>
>  conf/layer.conf                               | 2 +-
>  recipes-extended/glusterfs/glusterfs.inc      | 3 +++
>  recipes-extended/librdmacm/librdmacm_1.1.0.bb | 3 +++
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> --
> 2.20.0
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000033c9a705883d655e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, May 5, 2019 at 10:17 PM &lt;<a href=3D"mail=
to:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a href=
=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com=
</a>&gt;<br>
<br>
Re-send v2:<br>
* Maybe wrong recipient in previous v2 thread, Bruce didn&#39;t recieve the=
 3rd patch. So re-send.<br></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">thanks. I got all three this time.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">They are now merged.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kai Kang (3):<br>
=C2=A0 glusterfs: remove PACKAGECONFIG libibverbs for arm 32 and mips<br>
=C2=A0 librdmacm: set imcompatible with arm 32 and mips arches<br>
=C2=A0 layer.conf: depends on meta-filesystems<br>
<br>
=C2=A0conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-extended/glusterfs/glusterfs.inc=C2=A0 =C2=A0 =C2=A0 | 3 +++<=
br>
=C2=A0recipes-extended/librdmacm/<a href=3D"http://librdmacm_1.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">librdmacm_1.1.0.bb</a> | 3 +++<br>
=C2=A03 files changed, 7 insertions(+), 1 deletion(-)<br>
<br>
-- <br>
2.20.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000033c9a705883d655e--
