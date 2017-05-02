Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A292E003C1; Mon,  1 May 2017 23:33:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.171 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.171 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6AA9E0059A
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 May 2017 23:33:09 -0700 (PDT)
Received: by mail-io0-f171.google.com with SMTP id a103so144653785ioj.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 01 May 2017 23:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=2y5JBBzKSGXgoiJLBJ//ph8xaQIoxCca+zOmjcVmbTI=;
	b=FFOJaDwt7v/fwm+8ICBrJhe/v45lw3T2bXA6Kkc+tIbDgifaxGtEAYHylxli/JhNbo
	FtlT2eL/tMRTls+ErbzoZQC2WOs+UdxOKzf0iAisn/loqE0Xsdgs5yP5g0N9jpnwhg/9
	eg3sEXzqfsgSulsneixQeLdmePdyIaWKniZ18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2y5JBBzKSGXgoiJLBJ//ph8xaQIoxCca+zOmjcVmbTI=;
	b=KrRejS32PmhMIhzh/AdPzWS/ehvro4Qavbd2q2gMyITnnH2kgYDBVBnwZ4k8/KjPXS
	4U+Y74M3w8dEK46sZykuyr4xI3uPmmG1MCrwco7q0Wg+LCBvv3KXBC948xFE/efHUYnP
	cVi69w7R85J1Vo+H2IFUYaZEOrz2bdW3qZN6juR28RMQyaC2dlE/6jBgWT4guYPmdlhY
	aFHgDFY7S4+YgRjXwOIMnT941NpQPHxdUP3NpLMJxpgBZWwrHGEG5IcFSskUb/e26ufj
	8oYEi5ApLzURlVTpTh2m3MbN5b3tdUPnjAeWbjrdIaRr8ZWrPo0I1txCJ6tshA5dodko
	+D/w==
X-Gm-Message-State: AN3rC/5M/JREsc40ClqeJSVgyD3bOmSj4RnG900pBkAXJYOEYaDigF87
	pULXpXCC2b0BqRMeOHNh94zknz7RCpaSshA=
X-Received: by 10.202.221.130 with SMTP id u124mr9504008oig.135.1493706786886; 
	Mon, 01 May 2017 23:33:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.12.181 with HTTP; Mon, 1 May 2017 23:33:06 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Tue, 2 May 2017 08:33:06 +0200
Message-ID: <CAFL6qn5czUYrKRLPxhZbj7EEAgMu_dFr89WNsDBaYxVWKppM_w@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org, 
	meta-virtualization@yoctoproject.org, yocto@yoctoproject.org
Subject: xen-image-minimal testing
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
X-List-Received-Date: Tue, 02 May 2017 06:33:12 -0000
Content-Type: multipart/alternative; boundary=001a113d62b66e68e9054e84b68c

--001a113d62b66e68e9054e84b68c
Content-Type: text/plain; charset=UTF-8

Hi all,

I have built an image using "xen-image-minimal" command with Yocto and I
would want to know how can I test if xen functionalities are correct or not
with Zynq MPSoC QEMU. How can I do this?

Anyway, I have seen that sometimes in the QEMU terminal appears the next
message when the mentioned image is launched by "runqemu zcu102".

INIT: Id "X0" respawning too fast: disabled for 5 minutes

What's the meaning of the message? Is it critical?

Any answer will be welcome,

Best regards,
Pello

--001a113d62b66e68e9054e84b68c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I have built an image using &qu=
ot;xen-image-minimal&quot; command with Yocto and I would want to know how =
can I test if xen functionalities are correct or not with Zynq MPSoC QEMU. =
How can I do this?</div><div><br></div><div>Anyway, I have seen that someti=
mes in the QEMU terminal appears the next message when the mentioned image =
is launched by &quot;runqemu zcu102&quot;.</div><div><br></div><div><div>IN=
IT: Id &quot;X0&quot; respawning too fast: disabled for 5 minutes</div></di=
v><div><br></div><div>What&#39;s the meaning of the message? Is it critical=
?</div><div><br></div><div>Any answer will be welcome,</div><div><br></div>=
<div>Best regards,</div><div>Pello</div><div><br></div></div>

--001a113d62b66e68e9054e84b68c--
