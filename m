Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A554E009CF; Mon, 27 Feb 2017 05:32:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
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
	*      [209.85.220.172 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.172 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 005DBE00970;
	Mon, 27 Feb 2017 05:32:54 -0800 (PST)
Received: by mail-qk0-f172.google.com with SMTP id n186so20504524qkb.3;
	Mon, 27 Feb 2017 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lP/DYGoRyD7kW7jrVwiXvIAGUQ9Sggqire9so6CY7yM=;
	b=haShl/NojKZz0STHiDXNZp0L92rGmtfL4dlgI8OhGoOD4RxmaD/K8IyM2m+tNhGcrl
	YU0hND34bPiuAd817OwRJdVNrogcQqC4Q1WKOsDRpsr/DSduOIHDNLxVJqtlbPYgUMMP
	VoIiSzl+4wnFLp5ZQ/HzQMHcNxpUlyor87UPvvVBnA9FzDb5wqfApU/ojvwJ8z1W470U
	JhftSk1O381bKd33sIGvcasTlL8zqQErSY96UZ6Z4nkJ580xLt73RqtlljT2Qc4GSohP
	iuG7wIQTYxMSpdP7ioHGuRVOPt/f939B/+U7G/P1kwFCVGqKoMzGZBeV9ifM0WAm0FI3
	3IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lP/DYGoRyD7kW7jrVwiXvIAGUQ9Sggqire9so6CY7yM=;
	b=qkr3TDw8ExdZiBu34nb5DGseuAWfCxp2rgG1CGxYdoZ/8N8kC+v+oGuLbgiFb5eBnk
	4MciIiqsnLadn/tmFaiG5AHPt0Bm0n4+APUVLqPLAmafDvHWl9e1h/Zdcvq8WBBaC+JX
	eARqwTO4Zvbpf7jL8TrWE0qndbVVFtXusf+FpqRJR7LyPiiROPDbVcZ/b1r8uY9Gjdvk
	+vSLwXe7CISZfpgCEMNOhKQmFIK+xnBkdasTL/7Ke6SIDma+YX6UIPtCzY3DO+r7orqg
	rHSYQb3WK2+ys+woNNTWTE5Xd4DOHDroLslOwCxm2W6h6tqTbPqGvjlVmF6Iqy3jEY5f
	RiIA==
X-Gm-Message-State: AMke39maQl/axz7Id4NEEdbWOFscuoANfHrB9pa325tWWqaAFEh+PT5f36RtfkE3LoL/jdFxEbUv18slgcf9qw==
X-Received: by 10.55.139.67 with SMTP id n64mr17325886qkd.157.1488202373707;
	Mon, 27 Feb 2017 05:32:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.132.68 with HTTP; Mon, 27 Feb 2017 05:32:48 -0800 (PST)
In-Reply-To: <CAFL6qn7dufbc3dgfDywS0FNFP7DzCicuXJtGnDJDXMy1YVcX8g@mail.gmail.com>
References: <CAFL6qn7dufbc3dgfDywS0FNFP7DzCicuXJtGnDJDXMy1YVcX8g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Feb 2017 08:32:48 -0500
Message-ID: <CADkTA4PNN_s5==0=d+64sWY377UQcF5JWjuFOxNaPx3sfzerBw@mail.gmail.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	"meta-xilinx@yoctoproject.org" <meta-xilinx@yoctoproject.org>
Subject: Re: [meta-xilinx] Using Xen hypervisor and Docker on MPSoC QEMU
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
X-List-Received-Date: Mon, 27 Feb 2017 13:32:58 -0000
Content-Type: multipart/alternative; boundary=001a114f8b88d6d9220549831d71

--001a114f8b88d6d9220549831d71
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2017 at 5:51 AM, Pello Heriz <
pello.heriz@alumni.mondragon.edu> wrote:

> Hi,
>
> I'm interested on building an image for ZCU102 board using Yocto Project
> for then test the image on QEMU emulator. However, I need to know if is i=
t
> possible to add docker and xen hypervisor functionalities to the created
> image just adding the meta-virtualization layer in the bblayers.conf file=
.
>
> I have never experimented with Docker and Xen, so I don=C2=B4t know if ad=
ding
> this layer would be enough or what I need to do exactly.
>

There are some other layers that needed to be added. The list of
dependencies can be found in the README at the top level of meta-virt.

Bruce


>
> I would thank any reply,
> Thanks,
> Regards,
> Pello
>
> --
> _______________________________________________
> meta-xilinx mailing list
> meta-xilinx@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-xilinx
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114f8b88d6d9220549831d71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Feb 27, 2017 at 5:51 AM, Pello Heriz <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:pello.heriz@alumni.mondragon.edu" target=3D"_blank">pello.her=
iz@alumni.mondragon.edu</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m interested on building=
 an image for ZCU102 board using Yocto Project for then test the image on Q=
EMU emulator. However, I need to know if is it possible to add docker and x=
en hypervisor functionalities to the created image just adding the meta-vir=
tualization layer in the bblayers.conf file.</div><div><br></div><div>I hav=
e never experimented with Docker and Xen, so I don=C2=B4t know if adding th=
is layer would be enough or what I need to do exactly.</div></div></blockqu=
ote><div><br></div><div>There are some other layers that needed to be added=
. The list of dependencies can be found in the README at the top level of m=
eta-virt.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr"><div><br></div><div>I would thank any repl=
y,</div><div>Thanks,</div><div>Regards,</div><div>Pello</div></div>
<br>--<br>
______________________________<wbr>_________________<br>
meta-xilinx mailing list<br>
<a href=3D"mailto:meta-xilinx@yoctoproject.org">meta-xilinx@yoctoproject.or=
g</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-xilinx" rel=3D"nore=
ferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/meta=
-xilinx</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow =
the NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a114f8b88d6d9220549831d71--
