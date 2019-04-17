Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EF89E00D47; Wed, 17 Apr 2019 13:42:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.173 listed in list.dnswl.org]
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E356E00CE8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 13:42:35 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id f18so23724489lja.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2019 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=NWTQX4UVgMvWoYANBxHNfxxVQqQnvWGM6RECLCd+Su4=;
	b=SPb/XcrF5l6pC9j5jrF5Ej3Dta9DHNXnlhpsIzEhl3hRoI+X8ZUrJ/9VcvUDiEo8JJ
	V6a7Vps88HJkwrb1MDAu/X18Lh18NpAOKPOC4mq53Z6FH1Y+Z44QOlTG/Z8Jyor7ADfx
	s3CGmC48VFvfxXICl0QWSY15185JBNS+CkWJ6ODIreol0Klh2mnNIsH6jNA4QzbNoRtW
	tO42hPlk9bKcncm1QBRxR76Y9K/FSIrlMrw33+o4xfb2l2/L9x8dYoaEJE235iEWO/TC
	39YbXrt4WQH3xKT6SeY8gfpID5SCmtWr2HHqfcQ2pZv5ks/yr1eqOxVvZXoHsbXx/+3P
	JKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=NWTQX4UVgMvWoYANBxHNfxxVQqQnvWGM6RECLCd+Su4=;
	b=oXxs/q8pRcFeH7OMRta+CP9StX9XoD9h5lb8Tia7d3qWBX9UH0ysCSixUmx1farl23
	Rd58oNwlVjJE0PnzcV0YH6zRfCC0qy2xExmDPk4RCY6jfJdlKeft38oc+vegtq2p13cu
	TxOcgnndU2zYx95W1gm6wmHzB4saYmuyGJQMSZ2TtEhu7B8o1lUNjpUzVZyJHXkq13kN
	EMmLHg+xiIlrVgo0fPd6S7/XTVmHmukMa2M0azuvbsXKNW4puhvpJhENWqIzdZJ4PNLX
	aMHAteIlhXPftLe5gvprcR5hgOiMppWVjiKZa34zFFhEIx2+ofg3lnrwua82rxFjs/wn
	gJrQ==
X-Gm-Message-State: APjAAAVs7sS6TJ933+oZQcI/jkVQ5+BT8SB19Ba/h0uYkNxnxNzF1TX0
	5wCT3ZUPk8WhETc0rg/Pp2ygdB2iCJcqt3KuV+cNbWY/
X-Google-Smtp-Source: APXvYqzINbnGLgQBQfv0UujK+rOmVNrhpyETCHV08iwKFJAsaUrsfqfTeFtpWv+HTy80EzJ5gjQVNL6xGaIZln48YHk=
X-Received: by 2002:a2e:968c:: with SMTP id q12mr47975487lji.36.1555533754049; 
	Wed, 17 Apr 2019 13:42:34 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 17 Apr 2019 13:42:22 -0700
Message-ID: <CACMJ4GbOz4U6Uj-7ZLpggrrrAhxCw25EH80RiR3Gq7aDYJM2BQ@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: thud backport request: ipxe build fix
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
X-List-Received-Date: Wed, 17 Apr 2019 20:42:36 -0000
Content-Type: text/plain; charset="UTF-8"

Please could the following ipxe build fix be cherry-picked from master
into the thud branch.

commit 4cbd6c2b467c1f4caa32b2f782072739ab373065
Author: Christopher Clark <christopher.w.clark@gmail.com>
Date:   Wed Feb 20 16:52:03 2019 -0800

    ipxe: Uprev and fix host compiler and linker flags.

thanks

Christopher

