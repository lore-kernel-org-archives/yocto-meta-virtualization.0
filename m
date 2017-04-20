Return-Path: <max.malisan.uk@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85A82E00972; Thu, 20 Apr 2017 07:00:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.177 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (max.malisan.uk[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.177 listed in dnsbl.sorbs.net]
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4D8FE0092B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 07:00:39 -0700 (PDT)
Received: by mail-io0-f177.google.com with SMTP id a103so72427920ioj.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=A7fEWMolvAk1g/dII8BRKob+1E/Dpxd3Ily+kXkI7fk=;
	b=j0IPSbsYQHHkxd5drO5/2E8xlcUPSkQG910itHcb5kRdfnDRzCAxAKj0mZNQDeaKrP
	TrLpdOCPGqBwzSKZT5fpHR0dKzLz0flXX4mDn9XXsLSWjNBwzUL3GJqeWiriiFjTN4Xm
	XRARTUK1mgx5lJo8zVuGN/q64L+HRV/6mZSgQqxeVyasxQQTpZakp3AOuDDu46/Nrj/7
	pmQEQt9vU+vFtnX7/QlfPeEbPE+I1MqyIBgPktSRWfAp2GDdLpSlIv6FuMi7qfA+BkOq
	+1s1Gdc4xzSxQnDL7028NOeSZLVLx6zpYVp+ZWtbMvrr3gUyowR8VmHYECx7w93uHxN0
	IyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=A7fEWMolvAk1g/dII8BRKob+1E/Dpxd3Ily+kXkI7fk=;
	b=CxOqk4sqYDIuYqh9BR+EvFb32C4Ql0NKkXzb1FNkxqHDOOceb1A+ByRLwuPXwaHuS8
	DRd8n3n1+052lF7E20A9Yj8PdwsMx+CVtelNkkuu9ceVIhcHXUTffcPMSQF7M38A3TtG
	4GHaEuBonCG5jpkR2Bkd4f9y2rKqKA6mquhZJLnfbrqy587Ic7P6aGz7qlvlDG3yZtlt
	itUheX/eCSdmY2KacNY4NCcvBvipv/tSZQu2y1ZA492cPNbtbf96ER24UPG1b4E97fjo
	xPtxPBb/Cu4/5BwSGynlLaVnfYUVMJvtFJlgv0jALm+8qd5zFuB5VRhmXeLsDPvVIhgK
	NrGg==
X-Gm-Message-State: AN3rC/5aRVI+SGzkSl4lWGIu5I9J7KGTmFqp6kYhuGAnZILIFqYti3Q4
	IUSpdVS+qHAYP+6MaFFeIejvd4z4W0AD
X-Received: by 10.107.142.201 with SMTP id q192mr8942473iod.138.1492696835136; 
	Thu, 20 Apr 2017 07:00:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.164.11 with HTTP; Thu, 20 Apr 2017 07:00:34 -0700 (PDT)
From: Massimiliano Malisan <max.malisan.uk@gmail.com>
Date: Thu, 20 Apr 2017 15:00:34 +0100
Message-ID: <CADM9VctCY=M2_HeiXh-e7CqZ2cibt2V3mUFGhe7xHJ=Zevi7iA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: LXD anyone?
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
X-List-Received-Date: Thu, 20 Apr 2017 14:00:41 -0000
Content-Type: multipart/alternative; boundary=001a114ec68c9dc337054d9990b5

--001a114ec68c9dc337054d9990b5
Content-Type: text/plain; charset=UTF-8

Hi all,

is anyone currently working on creating a recipe for LXD?

I have been working on one in the last days but I still have some issues to
have it run properly; being quite new to Yocto I am not sure if they depend
on something in my recipe or some other missing dependency or
configuration, so any other voice is more than welcome.

Cheers,
    Max

--001a114ec68c9dc337054d9990b5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,=C2=A0<br></div><div><br></div><div>is anyone =
currently working on creating a recipe for LXD?<br></div><div><br></div><di=
v>I have been working on one in the last days but I still have some issues =
to have it run properly; being quite new to Yocto I am not sure if they dep=
end on something in my recipe or some other missing dependency or configura=
tion, so any other voice is more than welcome.</div><div><br></div><div>Che=
ers,</div><div>=C2=A0 =C2=A0 Max</div></div>

--001a114ec68c9dc337054d9990b5--
