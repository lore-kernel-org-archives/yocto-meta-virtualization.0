Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60A49E00D35; Mon,  5 Aug 2019 18:04:52 -0700 (PDT)
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
	*      [209.85.221.54 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80A92E00C22
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 18:04:51 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id g17so86128872wrr.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Aug 2019 18:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k/1rLTOFjwTRBBir2xHOQgS28nYnY1dwVVPdnWEdZTg=;
	b=kvrIwId8zvnUlMmPwRZcm9s1oysXa0xrrl2DeghwZl8g+WQdmXxWLaz660P2xzAP+U
	lE4TxWioxDK2wHezRLiw0sWjSF+pqvXwBgmmboBtK5iCtAvDWzSp83ULlXDQVKIrpOfQ
	F9NNYHkmcmIsIKOck3b6Po/dnYHBrh5kD2sVw4mjjhs2jC6hXynMGPu4GqgisGwB7alr
	mdABX/4l96RxwlUe/HZh2kFJPjM4UGzk67DUuWBkTNXMOn42wbCR+4hT627cQjmrF8sM
	K3wt1/y58XZZQDH5hL4ZgCBvXzNPtoj3+9tQviJtt9tbfqISuAli+YUcVrM+BLb1xqQA
	c/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k/1rLTOFjwTRBBir2xHOQgS28nYnY1dwVVPdnWEdZTg=;
	b=pZUh86INKrw42EPrPyTdxEvRkKs8bX30ikysgptwc01UJemPY+hV48NV77eBFoM9hH
	CN6yQbVbIRz5tXDjmZJVcRIbQMo4DrTmtHDtBLZXYXUn70dBFarBwRCR293iveANkHQM
	cCx4URb75a337C6KmV30fvKas9k6IdKfMwNLEvSpLAWfeCc46zkqycyK76DRAQhtEXXM
	JYjx0lYlIYrPESw0YqmigZk2iUZ9UGEV+HqJ+wK1yoSLgE3ps2TWCXz9yhBJgae3eb/I
	Lom+496uq3SQrsDMuziOOlrlkHh3Su7OkpuJy/XQd2o7bWyMp1eXxDuuLnSaDQzX8d+B
	H59w==
X-Gm-Message-State: APjAAAWm2alI79bV//9OI1GGbfvt6LWcqxV9EB+zexTzmdXa/a1Hdj4g
	k+1hK6NLWH3BI9q5MFvTCvifGh8KA7ZUhBsAg3s=
X-Google-Smtp-Source: APXvYqzgboJMvzHYRj2xVK7iqVyi7X5X9SnwmIRoJvtDmyXcuQ0imK9qtMiFkIfxhgxtPz992pk1muAM9XWBpwhW22c=
X-Received: by 2002:a5d:5692:: with SMTP id f18mr653714wrv.104.1565053490236; 
	Mon, 05 Aug 2019 18:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190805115610.29854-1-Qi.Chen@windriver.com>
In-Reply-To: <20190805115610.29854-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 5 Aug 2019 22:04:39 -0300
Message-ID: <CADkTA4PrJuT8wxwGeFGTztsyD0j8veTqXF1W37g77y9Te2X-Lw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] .gitignore: ignore .patch files
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
X-List-Received-Date: Tue, 06 Aug 2019 01:04:52 -0000
Content-Type: multipart/alternative; boundary="000000000000571184058f686975"

--000000000000571184058f686975
Content-Type: text/plain; charset="UTF-8"

Not that I fundamentally disagree with the patch .. but why would we want
to .gitignore patches ? I personally want them to be picked up as changed,
or if they've been dropped in the wrong directory.

Bruce

On Mon, Aug 5, 2019 at 8:56 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 65feb82..f0047e5 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -3,4 +3,5 @@ pyshtables.py
>  *.swp
>  *.orig
>  *.rej
> +*.patch
>  *~
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000571184058f686975
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Not that I fundamentally disagree with the patch .. but why w=
ould we want to .gitignore patches ? I personally want them to be picked up=
 as changed, or if they&#39;ve been dropped in the wrong directory.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 5, 2019=
 at 8:56 AM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@wi=
ndriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.c=
om" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.gitignore | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/.gitignore b/.gitignore<br>
index 65feb82..f0047e5 100644<br>
--- a/.gitignore<br>
+++ b/.gitignore<br>
@@ -3,4 +3,5 @@ pyshtables.py<br>
=C2=A0*.swp<br>
=C2=A0*.orig<br>
=C2=A0*.rej<br>
+*.patch<br>
=C2=A0*~<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000571184058f686975--
