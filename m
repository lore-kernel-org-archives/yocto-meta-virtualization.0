Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A69FD88E5
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 03:17:54 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12560.1773199069130540046
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 20:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ad72uauA;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso5064616a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 20:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773199068; cv=none;
        d=google.com; s=arc-20240605;
        b=YI4J75afZNp1UOXkALp1XLz017NhwzMyS8bB4H9otxM8UG4OvVqrPlKFDAksHX3NKz
         /5uREdZn+OeHL1y1nKOF6BYq/2ug2GPueiGK3aGBMCAgVqkqR1Tj5TciH1dchjeVTGc+
         ogQqMx/tKofLjTN9uCDNEv6tGq1OD3HtfuGzbX9RGUV4RbDuir/B1hM4K2M+jTjFG5q5
         OkvPSQNUzMt6ddIsPW+lkUywWabk/I6Qt3VMHli4A4BKbzoBgTbHkyV57ezHTmaf8Ay8
         6mhSP6mYRD7qUsWyIFwX1tiWwDQ8uAno53wP/pG05l3wUyVZmcOMGPsJc6C+poNlkO+c
         zX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bVxHGebURwwU6cy5p7C59dAHT3OhbEnRUn0nLtQ2oj0=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=OHMBqkk+PIK22zhOLCt2v9Jj3+OoWtZwIQvhyDUf4PRoeo6f2GzzwQ8XL1BwLdSBVD
         S1kv2L1QDSrKAvFDUbc+jQtoY852N9IJgaRK88Tatfp+vrjgzqSkbBas+61od7NBL612
         NqgOXiAROilQvESutCF85EIRYdBxVQ+agIt1ON1ndYY3YWUKMQXuZeGkn/yygL7R2LXB
         iL0PJCV3qlV1sADBn9Y1K/EMI7UZNsLPnzuP1hhHS/x/0K1v2MsxgB1J1+/x8OZwSE4+
         MFJgTygWgIK1U+AWsA+x3xnJX4xl8vPn+Oqcbb1sUUhxdycAEuO+80Nnta2B76Oijvkz
         E4aA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773199068; x=1773803868; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bVxHGebURwwU6cy5p7C59dAHT3OhbEnRUn0nLtQ2oj0=;
        b=ad72uauAqIjrbsCCOnIaBzwDZssQZ9XAUnTjdTwUrpF27PWwefC78xbz9dDYZFeWAX
         EHudc9XC8QHuszD2i57E386oYzzMQy6icjYm2VbdZyiAK3OeIyb6AV7dgR6e+kc5WNiG
         190Q01on8GxTZprgfDshrx/jmB/h35jJJ9OSaXpRxbgZKh0VHJwU1LR2F44SbDrLYvUC
         ycRgrolbmbemWXajIwutWskCAyl/DjaUjkxDKamZP4v4TJY+CeVrj0eEvvIwii/IDfsn
         Wmp2Ez9mWlWQ+XXXihdQzHHHqDQ8xvTamuzCwwqi3aX0QcJd82cvhvW6UBXP621glAU3
         Lh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199068; x=1773803868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVxHGebURwwU6cy5p7C59dAHT3OhbEnRUn0nLtQ2oj0=;
        b=iXWPZPNPxGcbdDOBevTvNNxCHpgiNxJHfsofzaj0tPRYaNV2fRec1lGkCtcBnFvI3Y
         0ly2h038f8sY/De70UBJ5PkZa/TsI+9l0PO6dp3kBYKcMimwrv6Qx1trs7DKcFqyhpwN
         oIS/TAW9Mhe4QvHHHv/4FQnYpiquoD+ymQRcXT1YeO8tmZPkR1y5oos9QYaF4abgUWen
         ZtuJ4pFBfllHfWhqwV8+2as5AHdfG3PIV4qexmEz+6ISQM816soC1veVNku/sUhfpZts
         /cwwIhZKOjnG17Zftwt3fNDq7VVmArdW0SWKo45xPSTMAW+adHk3AzM/ZF/NQKEOSViP
         D29Q==
X-Gm-Message-State: AOJu0YwmjwHK4YjqgA3xPCS5fZ7pfVDDxlMzylaF9boP0SCu+CT0I5pN
	NK/8JLAvJhJlfXSkYQFFgttdRNxZ2rMkpuEmK1D+lQbEmlwn9oo3RzJwMwXKb2HlEtlC5Au8lfn
	vjIsV0zU+i/+lBN5zncQGL1+VGZoYByo=
X-Gm-Gg: ATEYQzwJXSfjurc34EH3BjEvM+KIxKpxtcnezuYBOfId6nvl/QVZts2VR0k/4V7ELJ5
	tubph2bisfrK1vKQzHRyt9CRqxIg4R7HR1uzoTcJuZOGtACLPu0mkUOzxQJKuoh413Dsgd0AXqD
	ftN3dvC4LI4IZ7CnHkyyJAW5COrZMY8YeX76J8cApZES0pk+YgBLKGPNCaU4eiGRlNQBpaCzWzJ
	eDBomqxHkLE9hdmQV96FpDDD58BUEcLGagEw+ECM1PfUsJodc2fQLdNjkKpXKGopob/EW2gX0Hp
	WTPhhbdHlrEkfVGc14yEm3qEBhk+GHsrfiEtOXrb
X-Received: by 2002:a05:6a20:728b:b0:398:62b5:d2d with SMTP id
 adf61e73a8af0-398c5ef248amr849769637.8.1773199068293; Tue, 10 Mar 2026
 20:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <OS7PR01MB14444C313A7F44936A3D8EBB99B46A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
 <CADkTA4Mt4E-Uj4G_Xrn9vK+imdA6WUaUGUNpopH3OrbyFSG=7A@mail.gmail.com> <OS7PR01MB1444404E20787B8BA716E9C659B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB1444404E20787B8BA716E9C659B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 23:17:36 -0400
X-Gm-Features: AaiRm51s23Dm20Tp75FNtbVDTiXg0b_otqHCaJ-8BhI5_rzgWaL07awYPpfyAoE
Message-ID: <CADkTA4Ph_hP7=zs8RC8F5SUdmO_MLwDqYB1u-yPt0vPGWxPUKg@mail.gmail.com>
Subject: Re: issue about classes/image-oci.bbclass
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000094ecf4064cb71415"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 03:17:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9642

--00000000000094ecf4064cb71415
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 11:08=E2=80=AFPM Yiding Liu (Fujitsu) <
liuyd.fnst@fujitsu.com> wrote:

> Hi Bruce
>      I didn't mean to change the image-oci.bbclass but to fix the
> recipes-extended/images/container-app-base.bb
>
>
The answer is the same. There's multiple stacks on top of that example that
expect the current behaviour, so I prefer to leave it as-is,
but I can do some testing and see if anything breaks.

The container-app-base is intended to be extended for actual applications,
those are just placeholders.

Bruce



>      To make OCI_IMAGE_CMD as empty in container-app-base.bb, or it will
> have a wrong runtime result as following.
>                $ podman run --rm f0d79291ef08
>               date: invalid date '/bin/sh'
>
>      Maybe a patch like this?
> diff --git a/recipes-extended/images/container-app-base.bb
>  b/recipes-extended/images/container-app-base.bb
> index 34381ed2..4a1deac2 100644
> --- a/recipes-extended/images/container-app-base.bb
> +++ b/recipes-extended/images/container-app-base.bb
> @@ -8,6 +8,7 @@ include container-base.bb
>  # container. What we have below is a placholder. if you run this
>  # container, you'll get the date echo'd
>  CONTAINER_APP_CMD ?=3D "date"
> +OCI_IMAGE_CMD =3D ""
>
>      What do you think about it?
>
> Liu
>
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2026=E5=B9=B43=E6=9C=8810=E6=97=
=A5 20:28
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <=
liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> *=E4=B8=BB=E9=A2=98:* Re: issue about classes/image-oci.bbclass
>
>
>
> On Tue, Mar 10, 2026 at 2:49=E2=80=AFAM Yiding Liu (Fujitsu) <
> liuyd.fnst@fujitsu.com> wrote:
>
> Hi Bruce
>      I found an issue about OCI_IMAGE_CMD ?=3D "/bin/sh" when I use the
> container-app-base image.
>
>     $ podman run --rm f0d79291ef08
>      date: invalid date '/bin/sh'
>
>     The issue was caused by the Entrypoint and Cmd are both defined, and
> cmd will be the append args of date,
>     Which caused the output error.
>
>    $ podman inspect f0d79291ef08
>       ...
>           "Config": {
>                "Entrypoint": [
>                     "date"
>                ],
>                "Cmd": [
>                     "/bin/sh"
>                ],
>     ...
>
>    I think make OCI_IMAGE_CMD as empty can solve this issue, what do you
> think about it?
>    OCI_IMAGE_CMD ?=3D ""
>
>
> Nope. You can override that yourself.
>
> The current defaults have been extensively tested and modified just
> recently to make the entrypoint work in more scenarios.
>
> Check git history for all the details.
>
> Bruce
>
>
>
>
>    $ podman run --rm 70306dacdc4a
>    Tue Mar 10 06:27:42 UTC 2026
>
> Liu
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000094ecf4064cb71415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 11:08=
=E2=80=AFPM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg-3715019805696923123">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Bruce</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0I didn&#39;t mean to change the image-oci.bbclass=C2=A0=
but to fix the=C2=A0 recipes-extended/images/<a href=3D"http://container-ap=
p-base.bb" target=3D"_blank">container-app-base.bb</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">The answer is the same. There&#39;s mult=
iple stacks on top of that example that expect the current behaviour, so I =
prefer to leave it as-is,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">but I can do some testing and see if anything breaks.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">The container-app-base is intended =
to be extended for actual applications, those are just placeholders.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"ms=
g-3715019805696923123"><div dir=3D"ltr"><div style=3D"font-family:Aptos,Apt=
os_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:=
12pt;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt">
<span style=3D"color:rgb(0,0,0)">=C2=A0 =C2=A0 =C2=A0To make OCI_IMAGE_CMD =
as empty in <a href=3D"http://container-app-base.bb" target=3D"_blank">cont=
ainer-app-base.bb</a>, or it will have a wrong runtime result as following<=
/span><span style=3D"color:black">.</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:black">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 $ podman run --rm f0=
d79291ef08<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 date: invalid date &#39;/b=
in/sh&#39;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:black">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0Maybe a patch like this?</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
diff --git a/recipes-extended/images/<a href=3D"http://container-app-base.b=
b" target=3D"_blank">container-app-base.bb</a>=C2=A0b/recipes-extended/imag=
es/<a href=3D"http://container-app-base.bb" target=3D"_blank">container-app=
-base.bb</a></div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
index 34381ed2..4a1deac2 100644</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
--- a/recipes-extended/images/<a href=3D"http://container-app-base.bb" targ=
et=3D"_blank">container-app-base.bb</a></div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+++ b/recipes-extended/images/<a href=3D"http://container-app-base.bb" targ=
et=3D"_blank">container-app-base.bb</a></div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
@@ -8,6 +8,7 @@ include <a href=3D"http://container-base.bb" target=3D"_bla=
nk">container-base.bb</a></div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0# container. What we have below is a placholder. if you run this</div=
>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0# container, you&#39;ll get the date echo&#39;d</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0CONTAINER_APP_CMD ?=3D &quot;date&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+OCI_IMAGE_CMD =3D &quot;&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MS=
FontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0What do you think about it?</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:0px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MS=
FontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Liu</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_-3715019805696923123appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-3715019805696923123divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>=E5=8F=91=
=E4=BB=B6=E4=BA=BA:</b> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b> 2026=E5=B9=B43=E6=9C=8810=E6=
=97=A5 20:28<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b> Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=
=81 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.f=
nst@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b> <a href=3D"mailto:meta-virtualization@lists.yoct=
oproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject.org<=
/a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targe=
t=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b> Re: issue about classes/image-oci.bbclass</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small"><br>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Tue, Mar 10, 2026 at 2:49=E2=80=AFAM Yiding Liu (Fujits=
u) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fn=
st@fujitsu.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div>
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Bruce</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0I found an issue about OCI_IMAGE_CMD ?=3D &quot;/bin/sh=
&quot; when I use the container-app-base image.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 $ podman run --rm f0d79291ef08<br>
=C2=A0 =C2=A0 =C2=A0date: invalid date &#39;/bin/sh&#39;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 The issue was caused by the Entrypoint and Cmd are both defin=
ed, and cmd will be the append args of date,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 Which caused the output error.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0$ podman inspect f0d79291ef08</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 ...</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Config&quot;: {</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Entrypoint&quo=
t;: [</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;date&quot;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Cmd&quot;: [</=
div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;/bin/sh&quot;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 ...</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0I think make OCI_IMAGE_CMD as empty can solve this issue, what=
 do you think about it?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0OCI_IMAGE_CMD ?=3D &quot;&quot;</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>
<div style=3D"font-size:small">Nope. You can override that yourself.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">The current defaults=C2=A0have been extensiv=
ely tested and modified just recently to make the entrypoint work in more s=
cenarios.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Check git history for all the details.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Bruce</div>
<br>
</div>
<div>=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div>
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0$ podman run --rm 70306dacdc4a<br>
=C2=A0 =C2=A0Tue Mar 10 06:27:42 UTC 2026</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Liu</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
</div>
</div>
</blockquote>
</div>
<div><br clear=3D"all">
</div>
<div><br>
</div>
<span>-- </span><br>
<div dir=3D"ltr">- Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--00000000000094ecf4064cb71415--

