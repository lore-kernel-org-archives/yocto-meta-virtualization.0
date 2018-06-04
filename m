Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76F7CE00CFD; Sun,  3 Jun 2018 20:28:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 307A9E00CE9
	for <meta-virtualization@yoctoproject.org>;
	Sun,  3 Jun 2018 20:28:30 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id i83-v6so10688727lfh.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 03 Jun 2018 20:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9tiiHMkhptCBcrtvfIJeI2A/jMYEeZsKgug2MJ9Nq10=;
	b=gF3gMnL2OyYK5Nic9n7KMfBx5XGoH3ZhH+KTzYwwZ6xc/zwmrbobOrYjrS+EW7EPk/
	VQcEI1RJ4+dF0GLNkeXfW/NH1Jha6ju/5kBjhTFnIaonC6oVWcnNIOrcy3Y6zMfxLjNy
	+bLdG7Vz1nF0PAYzUY7trQzu8qkdgQG//XIUZ3TupufxwK3bbIBB1GKs4lyVA2v8cNSn
	0bwwW+sncdoUt+4sUGQV75YhfYKMxCZC553C+Yor4mfWfXsngTBgyX5+4IQX87GnmeKl
	u7p2RPiAYLWU3wdAfHIgGGROnN6sz6s8M1WWg9M1JnQ9aXSdNZxzFJs0adhBDCgFmR5H
	GkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9tiiHMkhptCBcrtvfIJeI2A/jMYEeZsKgug2MJ9Nq10=;
	b=p2WAQ35cOoynVrySBesBCFyqDFU3QfHmDCZ9cdXM3sGrwJTxidwXO5CFiimpSIcItb
	9Bi5Tidg82BKKlB/qI4i9vphnYOhTAIgGVSKg7JEZY8hFVd1mMAeJWFHo9m4cmLLghX8
	n1qLIz+7DIRNZthrTcBcuTgJfzn9GxfG8WunqH0hi9WZfhYK1WEMFNoG4XTCCtrayvD4
	e0/iF4eMPgDXFgYVv/vdhQEYX7N+qMrcC0+K6oW5PBGIuncnV7yBZaPWTbRH2LECPaft
	X2qBpXjgNpmC4Xb/cyMRnZo8QwYXVbyJmt0vWm1sBWiPyKgl2p9LgcYTJ4gfr2tTy1a9
	hlYg==
X-Gm-Message-State: ALKqPwctg1+PNcjcK9ybstEOETEigZjzki2/W5mHnnA/VNVw+WKkGeIZ
	wGoPmuAWLDmX+8dA8z6PuV9nLS2CexvDkc59tKbopA==
X-Google-Smtp-Source: ADUXVKJEkRdYpYMW3wBjqds94Sy8Ej6YOKNQqKzJQLKwzDR4ZcdE+uAI0rt0wwjuM74ADDbZeLKv0L+sZtaMv/9v9IQ=
X-Received: by 2002:a2e:5358:: with SMTP id
	t24-v6mr14241072ljd.129.1528082910027; 
	Sun, 03 Jun 2018 20:28:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP;
	Sun, 3 Jun 2018 20:28:29 -0700 (PDT)
In-Reply-To: <1527762666-30689-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1527762666-30689-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 3 Jun 2018 23:28:29 -0400
Message-ID: <CADkTA4OSs9LVpRH+9zO7o66DcKRaTZz0AaYLaWW6PzXWj6rCkA@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] tgt: specify -f option in order to load backing store device when tgtd is restarted
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
X-List-Received-Date: Mon, 04 Jun 2018 03:28:32 -0000
Content-Type: multipart/alternative; boundary="0000000000000a250c056dc88796"

--0000000000000a250c056dc88796
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, May 31, 2018 at 6:31 AM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Specifying force option (-f) to tgt-admin, makes sure iscsi
> backing devices mentioned under /etc/tgt/*.conf are listed, loaded and
> activated when /etc/init.d/tgtd is restarted.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  meta-openstack/recipes-support/tgt/files/tgtd.init | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/files/tgtd.init
> b/meta-openstack/recipes-support/tgt/files/tgtd.init
> index 52d98c3..350fd0c 100644
> --- a/meta-openstack/recipes-support/tgt/files/tgtd.init
> +++ b/meta-openstack/recipes-support/tgt/files/tgtd.init
> @@ -39,7 +39,7 @@ start ()
>      # if it's not ready.
>      tgtadm --op update --mode sys --name State -v offline
>      # Configure the targets.
> -    tgt-admin -e -c $TGTD_CONFIG
> +    tgt-admin -f -e -c $TGTD_CONFIG
>      # Put tgtd into "ready" state.
>      tgtadm --op update --mode sys --name State -v ready
>
> --
> 2.7.4
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

--0000000000000a250c056dc88796
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Thu, May 31, 2018 at 6:31 AM,=
 Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishna=
njanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Specifying force option (-f=
) to tgt-admin, makes sure iscsi<br>
backing devices mentioned under /etc/tgt/*.conf are listed, loaded and<br>
activated when /etc/init.d/tgtd is restarted.<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>support/tgt/files/tgtd.init | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>support/tgt/files/tgtd.init b/meta=
-openstack/recipes-<wbr>support/tgt/files/tgtd.init<br>
index 52d98c3..350fd0c 100644<br>
--- a/meta-openstack/recipes-<wbr>support/tgt/files/tgtd.init<br>
+++ b/meta-openstack/recipes-<wbr>support/tgt/files/tgtd.init<br>
@@ -39,7 +39,7 @@ start ()<br>
=C2=A0 =C2=A0 =C2=A0# if it&#39;s not ready.<br>
=C2=A0 =C2=A0 =C2=A0tgtadm --op update --mode sys --name State -v offline<b=
r>
=C2=A0 =C2=A0 =C2=A0# Configure the targets.<br>
-=C2=A0 =C2=A0 tgt-admin -e -c $TGTD_CONFIG<br>
+=C2=A0 =C2=A0 tgt-admin -f -e -c $TGTD_CONFIG<br>
=C2=A0 =C2=A0 =C2=A0# Put tgtd into &quot;ready&quot; state.<br>
=C2=A0 =C2=A0 =C2=A0tgtadm --op update --mode sys --name State -v ready<br>
<span class=3D"HOEnZb"><font color=3D"#888888">=C2=A0<br>
-- <br>
2.7.4<br>
<br>
-- <br>
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

--0000000000000a250c056dc88796--
