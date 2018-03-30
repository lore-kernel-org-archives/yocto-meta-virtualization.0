Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9D7DE00A6A; Fri, 30 Mar 2018 06:41:43 -0700 (PDT)
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
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF84BE00708
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 06:41:42 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id o102-v6so12620678lfg.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 06:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sQeuN2gBfjJ5uc24jLQ7wpcixjxkfZqk6yo7r9f99ck=;
	b=Po4iwTUuLsE1OGqrFcq9fbiiy4cWY8RB6jIwhXoqO5C5E0K8ZKcC16ItpaGr2hqhaw
	0XKk7Ln5JZPivtvvLFgN5jeZCgA9xA8e2R2IxDzGGa12LN8pXg+AsMbBULFPWt/4S10U
	reuxFMA9NcD4T4i5pyzax8G+14OLqVxF2xqy0j7ySyBH0tnue6a7skLIEWNypDjoR268
	7f+StIBa3qYot51/4pkWCTR8x0I60GtREnKPgQlLerqYTmAAdex0mWCUkVBCIV79x+/w
	jnWb8NZW7VOFT1ICz8wFVUOe5aolGOtaeyK+gxsYzHrnhd3PkpGI8qnc1AZ70CnWBPzR
	GWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sQeuN2gBfjJ5uc24jLQ7wpcixjxkfZqk6yo7r9f99ck=;
	b=jYhSLpwTCM1dXVCyusxgN4Q/iTrXx7SE9cHMap13IUnvKz2tMB7R3YEHuiHdt3k2Am
	fzzKIDUQfUKntdxAIbZBUlE9umF/g9Vob/9tOBqUoJVmlPxVh8PSdzX3JEDPl8lvGsu5
	NXc0ZI/gxN0xVCR8g4P+AAL2uD+zBUfv8oz46NYnnXCPiAMZS47qcSJWqWRZVWYK+Ug1
	vg4DDmg7c6OpKrR9D55/w0+bj6104Ybfnzu1mmutA0WJ4I+B+SHefjr57VkBjzq5C2l/
	qfCmBk3P3T1f8q4CP9EFDtLN4jtvydtVlLRkWlNRWb0B6x7mNiwpHtcqNt+XZkhtNL3v
	8wuw==
X-Gm-Message-State: AElRT7FWieNaARVrN2IBwsULgdvHqHciA6oxEqSxMtKaaIYNV5Qq9AHc
	lw488ICbuhbJ2n9bDvxppTL0Ja1imj1g1epx6zs=
X-Google-Smtp-Source: AIpwx4+/mkAdluelsIyGP735vJgAeVESuVYGOj3FZSHcr3RL3ttvmi44bd8zKi1IwxAUOKqMdPcfrpLfTqeOiAT+Twk=
X-Received: by 10.46.117.2 with SMTP id q2mr8569558ljc.12.1522417301438; Fri,
	30 Mar 2018 06:41:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 30 Mar 2018 06:41:40 -0700 (PDT)
In-Reply-To: <f2b90721d130471e931ec671e5557f15@xch-rcd-011.cisco.com>
References: <f2b90721d130471e931ec671e5557f15@xch-rcd-011.cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Mar 2018 09:41:40 -0400
Message-ID: <CADkTA4Pvh2wAc1-098_t1pX171t5Y9t1NGT0h5V1k_6n7v=3vQ@mail.gmail.com>
To: "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Include Docker in core-image-full-cmdline
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
X-List-Received-Date: Fri, 30 Mar 2018 13:41:43 -0000
X-Groupsio-MsgNum: 3277
Content-Type: multipart/related; boundary="089e082b46c87400840568a166a2"

--089e082b46c87400840568a166a2
Content-Type: multipart/alternative; boundary="089e082b46c87400810568a166a1"

--089e082b46c87400810568a166a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2018 at 3:58 AM, Shakthi Pradeep (tpradeep) <
tpradeep@cisco.com> wrote:

> Hello Team,
>
>
>
> I am trying to include Docker in my final image (core-image-full-cmdline)=
.
>
>
>
> Included virtualization in build/config/local.conf
>
>
>
> DISTRO_FEATURES_append =3D " systemd virtualization"
>
>
>
> With above change too I don=E2=80=99t see Docker in my final image.
>
>
>
> Request you to point me to some document which explains how I can do it.
>

docker is a package like any other.

You need to add it to your image install before it will actually make it
into
the final image.

How you add it to the image, depends on the image you are using. The
Yocto project docs have the details on extending an image with additional
packages.

Bruce


>
>
>
>
> Regards,
>
> Shakthi
>
>
>
>
>
> [image:
> http://www.cisco.com/c/dam/assets/email-signature-tool/logo_08.png?ct=3D1=
437626746093]
>
> *Shakthi Pradeep*
> ENGINEER.SOFTWARE ENGINEERING
>
> tpradeep@cisco.com
> Phone: *+91 80 4426 8312 <+91%2080%204426%208312>*
> Mobile: *+91 99 00 265 156*
>
>
> Cisco.com <http://www.cisco.com/>
>
>
>
> [image: http://www.cisco.com/assets/swa/img/thinkbeforeyouprint.gif] Thin=
k
> before you print.
>
> This email may contain confidential and privileged material for the sole
> use of the intended recipient. Any review, use, distribution or disclosur=
e
> by others is strictly prohibited. If you are not the intended recipient (=
or
> authorized to receive for the recipient), please contact the sender by
> reply email and delete all copies of this message.
>
> Please click here
> <http://www.cisco.com/web/about/doing_business/legal/cri/index.html> for
> Company Registration Information.
>
>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--089e082b46c87400810568a166a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Mar 30, 2018 at 3:58 AM, Shakthi Pradeep (tpradeep) <span dir=
=3D"ltr">&lt;<a href=3D"mailto:tpradeep@cisco.com" target=3D"_blank">tprade=
ep@cisco.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_7368091002736997804WordSection1">
<p class=3D"MsoNormal">Hello Team,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I am trying to include Docker in my final image (cor=
e-image-full-cmdline).
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Included virtualization in build/config/local.conf<u=
></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; systemd virtualiza=
tion&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">With above change too I don=E2=80=99t see Docker in =
my final image.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Request you to point me to some document which expla=
ins how I can do it.</p></div></div></blockquote><div><br></div><div>docker=
 is a package like any other.</div><div><br></div><div>You need to add it t=
o your image install before it will actually make it into</div><div>the fin=
al image.</div><div><br></div><div>How you add it to the image, depends on =
the image you are using. The</div><div>Yocto project docs have the details =
on extending an image with additional</div><div>packages.</div><div><br></d=
iv><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div lan=
g=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72"><div class=3D"m_736809100273=
6997804WordSection1"><p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Shakthi<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<table class=3D"m_7368091002736997804MsoNormalTable" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" width=3D"0" style=3D"width:407.25pt">
<tbody>
<tr>
<td colspan=3D"3" style=3D"padding:0in 0in 0in 0in">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><img width=3D"110" height=3D"73" id=3D"m_7368091=
002736997804Picture_x0020_1" src=3D"cid:image001.png@01D3C82B.08CE19B0" alt=
=3D"http://www.cisco.com/c/dam/assets/email-signature-tool/logo_08.png?ct=
=3D1437626746093"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td nowrap valign=3D"top" style=3D"padding:0in 0in 0in .25in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:8.5pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#666666">Shakthi Pradeep</span></b><span style=
=3D"font-size:8.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#666666"=
><br>
ENGINEER.SOFTWARE ENGINEERING<br>
<br>
<a href=3D"mailto:tpradeep@cisco.com" target=3D"_blank"><span style=3D"colo=
r:#666666;text-decoration:none">tpradeep@cisco.com</span></a><br>
Phone:=C2=A0<b><a href=3D"tel:+91%2080%204426%208312" value=3D"+91804426831=
2" target=3D"_blank">+91 80 4426 8312</a></b><br>
Mobile:=C2=A0<b>+91 99 00 265 156</b><u></u><u></u></span></p>
</td>
<td width=3D"50%" valign=3D"top" style=3D"width:50.0%;padding:11.25pt 0in 7=
.5pt 15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:8.5pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:#666666"><br>
<a href=3D"http://www.cisco.com/" target=3D"_blank"><span style=3D"color:#6=
66666;text-decoration:none">Cisco.com</span></a><u></u><u></u></span></p>
</td>
<td style=3D"padding:0in 0in 0in 0in"></td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0in 0in 0in 0in"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif;display:none"><u></u>=C2=A0<u></u></span></p>
<table class=3D"m_7368091002736997804MsoNormalTable" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0" width=3D"0" style=3D"width:300.0pt">
<tbody>
<tr>
<td style=3D"padding:3.75pt 15.0pt 0in .25in">
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:#009900"><img border=3D"0" width=3D"18" height=3D=
"19" id=3D"m_7368091002736997804Picture_x0020_2" src=3D"cid:image002.gif@01=
D3C82B.08CE19B0" alt=3D"http://www.cisco.com/assets/swa/img/thinkbeforeyoup=
rint.gif">=C2=A0Think
 before you print.<u></u><u></u></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:5.25pt 15.0pt 4.5pt .25in">
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:#999999">This email may contain confidential and =
privileged material for the sole use of the intended recipient.
 Any review, use, distribution or disclosure by others is strictly prohibit=
ed. If you are not the intended recipient (or authorized to receive for the=
 recipient), please contact the sender by reply email and delete all copies=
 of this message.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:#999999">Please=C2=A0<a href=3D"http://www.cisco.=
com/web/about/doing_business/legal/cri/index.html" title=3D"Legal Informati=
on" target=3D"_blank"><span style=3D"color:#0e58a0">click
 here</span></a>=C2=A0for Company Registration Information.<u></u><u></u></=
span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--089e082b46c87400810568a166a1--

--089e082b46c87400840568a166a2
Content-Type: image/png; name="image001.png"
Content-Disposition: inline; filename="image001.png"
Content-Transfer-Encoding: base64
Content-ID: <image001.png@01D3C82B.08CE19B0>
X-Attachment-Id: 570c8d1d7566d056_0.0.1

iVBORw0KGgoAAAANSUhEUgAAAG4AAABJCAYAAADc8hN1AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0
NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv
IiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RS
ZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpD
cmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNl
SUQ9InhtcC5paWQ6Mjk2MTRENjVCQTU1MTFFMzkxRDA4ODFFNUNDMzM3QzAiIHhtcE1NOkRvY3Vt
ZW50SUQ9InhtcC5kaWQ6Mjk2MTRENjZCQTU1MTFFMzkxRDA4ODFFNUNDMzM3QzAiPiA8eG1wTU06
RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoyOTYxNEQ2M0JBNTUxMUUzOTFE
MDg4MUU1Q0MzMzdDMCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoyOTYxNEQ2NEJBNTUxMUUz
OTFEMDg4MUU1Q0MzMzdDMCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1w
bWV0YT4gPD94cGFja2V0IGVuZD0iciI/PuJWD/MAAAbNSURBVHja7F1pbBVVFL7lvVbAFqxiXNis
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
Inf4R4ABACChbSCPwolvAAAAAElFTkSuQmCC

--089e082b46c87400840568a166a2
Content-Type: image/gif; name="image002.gif"
Content-Disposition: inline; filename="image002.gif"
Content-Transfer-Encoding: base64
Content-ID: <image002.gif@01D3C82B.08CE19B0>
X-Attachment-Id: 570c8d1d7566d056_0.0.2

R0lGODlhEgATAIEAAAAAAP///wCZAP///yH/C05FVFNDQVBFMi4wAwEBAAAh+QQBAAADACwAAAAA
EgATAAAIRAADCBxIsKDBgwEECEB4UKFChgYfQiTocOHEhBUtTqx4ESNHiBkddpQ4MKTJkAJPqgSp
MmPEliRLwny5smBLhCZZKgwIADs=

--089e082b46c87400840568a166a2--
