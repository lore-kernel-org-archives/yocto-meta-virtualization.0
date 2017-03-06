Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A47CFE00ADF; Mon,  6 Mar 2017 02:23:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.48 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.48 listed in dnsbl.sorbs.net]
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1EF6E00935
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Mar 2017 02:23:02 -0800 (PST)
Received: by mail-oi0-f48.google.com with SMTP id 2so82392546oif.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Mar 2017 02:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=cwIcM9W1mDockXv4tKCCOnSI0JrKoISQAzfg1ss8ogI=;
	b=EJ2/RlfRqjCPJF1Q4N3DA0MvwnEG/4ZUkOEx9BW8EEpPJtqesrT3SozJvHkiI8DcuS
	t8eInKe4UHGdVuQRch2Qk7LSbwSyeE2omcdosTaFcbWIvxGM3d2NB4vAz5S64cLiB31i
	gRmhV8EPEX1otqWcbEniF+flkpmEbisIZs7pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=cwIcM9W1mDockXv4tKCCOnSI0JrKoISQAzfg1ss8ogI=;
	b=S7yeGKJ/OAN7+f4LCBdSRQlVKnRYo9sSbgyx1BLLsjAdXGsDO9oAi5h6sXzXdhSNub
	pFoLVIyyXuT985Cptn33CYSl7Aou9SziO88d/7Y/1QwewbFIvpHmC0jKOrbZAXex2hwq
	3ngq64DZrAVraxIpuZ2AUiuT9eTeBedO5TkHDzxUkugqC52CCaTcI5vKmaEYXBooDL/s
	3MawegKobiMZXOHWUhKkP5WYm0N7U1Ph8Zi9qhG7fqguOAyl5z0OxT2k2IRpBB8uyTBj
	lxfQTHSg0wSFA5Z+gAMhNrBTjETYSDnaESyaMNIpcp6XjU79fagW17lNWcBDVd1lxvFb
	Jbuw==
X-Gm-Message-State: AMke39l7GxcivEfxFoMcQ2cPz5uzdWVTgz0lcB/wRon/vicFBsqkcsxbYjPdgbq0ULTaW7GRXcgwR6uHrPtoKT05
X-Received: by 10.202.94.194 with SMTP id s185mr8350914oib.196.1488795781371; 
	Mon, 06 Mar 2017 02:23:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.4.52 with HTTP; Mon, 6 Mar 2017 02:23:01 -0800 (PST)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Mon, 6 Mar 2017 11:23:01 +0100
Message-ID: <CAFL6qn47o85GDVoJeVMB62tpcug-=1nysU+OvWVMseS+3_Qpfg@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-virtualization@yoctoproject.org, 
	meta-xilinx-request@yoctoproject.org
Subject: Building xen image on yocto
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
X-List-Received-Date: Mon, 06 Mar 2017 10:23:05 -0000
Content-Type: multipart/alternative; boundary=001a113c09feb132ad054a0d4775

--001a113c09feb132ad054a0d4775
Content-Type: text/plain; charset=UTF-8

Hi,

I have read that I need to include "xen" in the DISTRO_FEATURES variable,
is this necessary at all? If it is, where can I add this to my project?

Thanks,

--001a113c09feb132ad054a0d4775
Content-Type: text/html; charset=UTF-8

<div dir="ltr">Hi,<div><br></div><div>I have read that I need to include &quot;xen&quot; in the DISTRO_FEATURES variable, is this necessary at all? If it is, where can I add this to my project?</div><div><br></div><div>Thanks,</div></div>

--001a113c09feb132ad054a0d4775--
