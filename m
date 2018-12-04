Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23995E00C62; Tue,  4 Dec 2018 15:19:01 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.181 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64850E00C62
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Dec 2018 15:19:00 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 83-v6so16536504ljf.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 04 Dec 2018 15:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ho4kr1jssKYmAThxeOY4pDFNo/EMX8rVedO+PbC7wfw=;
	b=DjvKqDYZNYXGMFs+rdORix/uZnJFmqz+TAINrfDkiAjrD3Na/MYt9Mmzzs1hMRMi8W
	ge85Z1cL5wGhmocxmvyjEIRSKOs9q9oYDvBPQQNFZytdlj8cBQqv6kwrDyyGuHhiN28R
	MD/Yf06IF6Y+db6EkmI6OO7Xs4TjPe5OnAMWo9DRmMvy5WCKM/7i9cg7aHuu4/bPzGm/
	d0PcdFTRcTeXamOfYT/lPLw0xOpsPj4DK+lRL7l0PQXPoJUZW+/8sxjTHvgUFlqTkzQs
	0pBePBcB5oQZOQAg1nk5gGLcJ9CLARRHiCVmWyd/Lkepcyq0gkf2ZLFMO8zmY+MQfo5j
	Ibng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ho4kr1jssKYmAThxeOY4pDFNo/EMX8rVedO+PbC7wfw=;
	b=M5bzRSuNUCq4Sf6AQnYd25EPu2VjQ4BKAuT9Ppxe6R1WLOjGLpFY0EBOqb7fMbC0sy
	o2RbOb9vU0BJ7284Ur2v+B2n8MOh1Ehp6DznZ67ujfDJXUe651Fmwg/ait4IjSdLLb+s
	hJUbw0hr/gKLLqY/1phVU+6qhsMY9/gqPMOGTC68QLtfYdHaunvS51PiBIiFuEysi/mG
	/Whx49unXZQSWVM90eIxZ/8XHhEdQDmH5pNZM3Ved0ohdsmPF9erFMYxINyTLa7NKEW5
	mtAIOP+glyvJHbVa//zq2qn8mYh1FzguO9q90juwTFJrCtOunqOwv2ONiLxT3gXwXU+E
	25Iw==
X-Gm-Message-State: AA+aEWbzkFvJBySPYoRNVRw+FNkzLHhL9D7A6AL7Dqs1D4HBZ3ecK0wc
	hHGdyXHfjs7CW1Fw7LaiS/t3n1fW5c7XE1/AsmoYWNvt
X-Google-Smtp-Source: AFSGD/XgsMLCP4qsyGKc7KxDaFa8iFLh5TLDwJ08xcvu606kFwOdwHbAN2v9dX8AyDM1oohoioacHLmAcUbBuRzBv7k=
X-Received: by 2002:a2e:92:: with SMTP id
	e18-v6mr15118597lji.130.1543965539150; 
	Tue, 04 Dec 2018 15:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20181202215515.14864-1-oleksandr.kravchuk@pelagicore.com>
In-Reply-To: <20181202215515.14864-1-oleksandr.kravchuk@pelagicore.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Dec 2018 18:18:47 -0500
Message-ID: <CADkTA4OW5b=rFr_drdB6YiwmJEQMRHN1fHuWtAnHmKOjiPRN2w@mail.gmail.com>
To: open.source@oleksandr-kravchuk.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] README: add optional dependency on meta-cloud-services
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
X-List-Received-Date: Tue, 04 Dec 2018 23:19:01 -0000
Content-Type: multipart/alternative; boundary="00000000000081b25f057c3a7d81"

--00000000000081b25f057c3a7d81
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sun, Dec 2, 2018 at 4:55 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Ceph package depends on libibverbs, which is provided by the
> meta-cloud-services layer.
>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  README | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/README b/README
> index 810f263..7c08db4 100644
> --- a/README
> +++ b/README
> @@ -59,6 +59,12 @@ branch: master
>  revision: HEAD
>  prio: default
>
> +Required for Ceph:
> +URI: git://git.yoctoproject.org/meta-cloud-services
> +branch: master
> +revision: HEAD
> +prio: default
> +
>  Maintenance
>  -----------
>
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

--00000000000081b25f057c3a7d81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun, Dec 2, 2018 at 4:5=
5 PM Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchu=
k.com">open.source@oleksandr-kravchuk.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Ceph package depends on libibverbs=
, which is provided by the<br>
meta-cloud-services layer.<br>
<br>
Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:oleksandr.kravchuk@=
pelagicore.com" target=3D"_blank">oleksandr.kravchuk@pelagicore.com</a>&gt;=
<br>
---<br>
=C2=A0README | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/README b/README<br>
index 810f263..7c08db4 100644<br>
--- a/README<br>
+++ b/README<br>
@@ -59,6 +59,12 @@ branch: master<br>
=C2=A0revision: HEAD<br>
=C2=A0prio: default<br>
<br>
+Required for Ceph:<br>
+URI: git://<a href=3D"http://git.yoctoproject.org/meta-cloud-services" rel=
=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-cloud-services<=
/a><br>
+branch: master<br>
+revision: HEAD<br>
+prio: default<br>
+<br>
=C2=A0Maintenance<br>
=C2=A0-----------<br>
<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">- Thou shalt not follow the NULL pointer, for chaos and mad=
ness await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, =
Star Trek II<br><br></div>

--00000000000081b25f057c3a7d81--
