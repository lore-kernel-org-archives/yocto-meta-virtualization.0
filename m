Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE9AFD2D6C
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:28:38 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38697.1773145712945867201
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 05:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FkKv2jV+;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82418b0178cso6834051b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 05:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773145712; cv=none;
        d=google.com; s=arc-20240605;
        b=SemUTGNblpqKqN9sVE37H+Mka7R35UqepuVKFeLa+2fRfnw4l224sDd+BrUOAboDUn
         XzTsvoulvBa1IqZvmSVXsnxATe3SJSsrJzZKu/P51Fi+DQMqSGYPYpJJxC+ABbrfLL4x
         cVLPdVYqbbTYlhcKiD7lymAP9YwDhzuJ5AL5pOqS4zRoLNJExIPvugzwjC2+V8kRDB43
         SeRepoWLfDheqIaLYkIw1djcrPPM4AAzWROYPe0R3PAX83ZF/3EgFuiFXesTcRzDQFKg
         NT0TQPTW1OM71Urq5GV1f3v4RFcnNEFnl+RelCKloczw+4zBfL42m8flIT0e6lockru1
         EDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MYECRIRyP2fLC9+j3znFR72ZmfaSiyxVlBAzkOcWZeA=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=FODYSqCkoOV9ktUNgh0vrjeUGptGRuoZSBv79fILptANcKt8vMUAQqO+hGiTo0vUYv
         O1ofrpQV9o9xqmU+ldjg4v0xhAyJDwdHOnScVtz5K3D/2siz3gpDtsT97upvxF8x1PC8
         Y6NGTris59Gihckppt6UQxGfUCUl6NYKVU6x0m5Z+NiU6iYOinl0tGK07imCvkGxBO7K
         K/u1v2OFU8+DjKLtEJvwFaX2pDPMccLrrrcjpvZc+b9pYa4H6L9mMkoW+2pN1Pdg4Ef/
         aMTHnGbGHNc1MemEgpuaotYgSh7A4oQQhjVAkPuKwio7e+F4nVesDmYK4PJxILrxEa8J
         mykA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773145712; x=1773750512; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYECRIRyP2fLC9+j3znFR72ZmfaSiyxVlBAzkOcWZeA=;
        b=FkKv2jV+/r1wnKcixYy5PZWy2SHPGc9UfQUgi4QuOsNVDtJv9Z1TMsBUj7dECuG5HJ
         bTRRjH44s9xk6QPzSOLVHYW6CVwtI8N/hl+g1MUuPordACe3GvINtXiXuuGuMtivnhSK
         A/FlvTkDgaqS2mCtePx+OZqjtkPW/5SvdJROB2s5ehIecAyfDDJxeWzVmv30inEOYcS1
         OuXAhf572tMYf7cUWFrp80DGnePvdqrfMmJ3CO49m0saB3EK7af+Fhv55FevBRLxKAJm
         HkJDyksVK841zsZasXRoe9H3v1GlrG4P5g/uvoE3fZvtbdEn8FQryRAsq6Ax0IeNslH5
         +39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145712; x=1773750512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYECRIRyP2fLC9+j3znFR72ZmfaSiyxVlBAzkOcWZeA=;
        b=FWtTb9JgG9fAHvF051F4FqKQ7l4FjBsa2eFGaHOfaXPvIOdTHigiQ+4vQPx6gUHgDT
         ci1diGoU1PqrPa999ZugWb7Z4ZvkiTrPQ7HpBOLUMtsDpzEIQ9s4fVSjZqO87TOFaZsF
         CYbA253U8A5fYKjwn4JS1rRlJL8T5OdFcoDQut8D9URT2doaLbtEdVnxykYfq6nn5X5l
         T1RZ7iJop5VrpSsURjrPznD7kYUE2K6yMcg7hh0hEwVaPpzbHZCqRoTWyhQHXGmDmvj0
         ixLmeI4YpzLVSwm84QzbfAvXpokDtUCIJuiJrqiSJotlWgh/mK8hSICvzxzXCHP1uyKR
         lBtg==
X-Gm-Message-State: AOJu0YwU1vGhJ9QvC9OZCePB4L2bcUh0o52EvLu3RbR7EvRRbiXuXXWJ
	N4OJ2zrD6+wzAwePG+O9nRW5ds/qQ8iGDMZMkHSOyZsgZb4hhJrONj4Tcg+zms1QPvNek3IrBSg
	amX1Ug5k+pFx2IBhEaY8j72bUyIBi/Do=
X-Gm-Gg: ATEYQzw1m2yFJiF4EyTNL54GFqnzkA6rzFJsMFV/ctdE9cjoIErBOtfUbMiIqGFicen
	L2LqeOKMZk91+4PRkMdj44ifCY+0f6kl7dh47n2MnTOJuf5bihKkSW9pI5WTM4Znr9c6aK3XVCd
	lOskZ2arpWNBvDCaf5QDx8+4CotbEXL7OLp1VDwBlIiLKdrkZKAOliRtEZbvIFaDQrfdQGHCX7f
	Pbj667UbZKZuG/OiDUPEhcIdFRlvmCiQ0WnQoXYkNuIY+LWLjRuZklOoZyWOLAdTYRrq4VR0JWb
	L3TqrQxZpxv+cK1upbgaOMrOEIs7JZixF1+f7wUl
X-Received: by 2002:a05:6a21:112:b0:398:a71b:a0c4 with SMTP id
 adf61e73a8af0-398a71bb71amr3840538637.6.1773145712281; Tue, 10 Mar 2026
 05:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <OS7PR01MB14444C313A7F44936A3D8EBB99B46A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB14444C313A7F44936A3D8EBB99B46A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 08:28:20 -0400
X-Gm-Features: AaiRm52YJjGOYYb_HmVmdpQAPlhVtK4M5DkupiQmyXc6JoL04d4N0V2JieJPDzo
Message-ID: <CADkTA4Mt4E-Uj4G_Xrn9vK+imdA6WUaUGUNpopH3OrbyFSG=7A@mail.gmail.com>
Subject: Re: issue about classes/image-oci.bbclass
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000050cd10064caaa88b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 12:28:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9632

--00000000000050cd10064caaa88b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 2:49=E2=80=AFAM Yiding Liu (Fujitsu) <liuyd.fnst@fu=
jitsu.com>
wrote:

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

Nope. You can override that yourself.

The current defaults have been extensively tested and modified just
recently to make the entrypoint work in more scenarios.

Check git history for all the details.

Bruce



>
>    $ podman run --rm 70306dacdc4a
>    Tue Mar 10 06:27:42 UTC 2026
>
> Liu
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000050cd10064caaa88b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 2:49=
=E2=80=AFAM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg4669832351290896661">




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
=C2=A0 =C2=A0OCI_IMAGE_CMD ?=3D &quot;&quot;</div></div></div></blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
Nope. You can override that yourself.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">The current defaults=C2=A0have been extensively tested and mod=
ified just recently to make the entrypoint work in more scenarios.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Check git history for all the det=
ails.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div c=
lass=3D"msg4669832351290896661"><div dir=3D"ltr">
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

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--00000000000050cd10064caaa88b--

