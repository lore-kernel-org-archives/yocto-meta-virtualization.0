Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB5BC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:44:30 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.28680.1657547062841461553
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=Pt8OY1VL;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 1B72F5C0064;
	Mon, 11 Jul 2022 09:44:22 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 09:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657547062; x=1657633462; bh=U8zE+tJCAv
	O+8guWxOZHFTmqZlT4ZX+QwabIS0w2ceI=; b=Pt8OY1VLvByJu39NpD3SqBlpcb
	tpSM7fwJnRR3TQMTEMnKH62Oi91by32FDg4t6GzSr6XOQJPX2QC/Wh+lHOwX+5uH
	Hw0ttJzfIO6Pq1Yk6dh1rl4/fIMPDxi1jPdctVyT2V/nQ7G043wrmMGcmLwsTcg5
	BPV8VNNwn/Sx6x+nLbrd5jTPs/8arjWVkKaGyZXjWysene66E+kiOonNU07zv/4i
	+JDtInpM8ESw9JA2L51cqwo9qM1ABHJBGdmapRbvRoezG2FlVrp50zgmH3Vzo9Au
	3yiXD6KghXHbfQ7Zmeo+cfsIGdufhSmpWaUf//JOkE/khDQY3dglK+gMw2Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657547062; x=1657633462; bh=U8zE+tJCAvO+8guWxOZHFTmqZlT4
	ZX+QwabIS0w2ceI=; b=y8AdevR7OGjEEwCeKVaOQjfcac5CJ5Y620ejNyPxBGmf
	kQ+esLVNYPYgjDN9SeR+Fr0f4F6vg+CrlDg1ADKMRfsXQuuXHNr3cNc2q9SnikSq
	NjKE1gXntpsmMbSiaEvzQ9UC/lJPm+oLDZGrzfZdfAxOrPzKOfAq7dJIw/m/vHXZ
	OBvJV5xkpIMJyajzmmeL481cArf1UzmtTQ8GMUChhB8Gpg8jRajN5pswrmetyOd+
	VxRhxbC5PTCyQjabRlzAX1XpjRoKHNmIFx+kBqlIcFvatueAVtw7L7RuV/1UNeqT
	lWHtvcsAmy9a7Pte5lbaHCKr/FLPlC1zUvuFYrwihA==
X-ME-Sender: <xms:NSnMYnV03bweTqJJDpdWqW1qN2oPgPqLhPvreUrq0DaFhFDj14ERPw>
    <xme:NSnMYvnPvXrato2TkWVxnKMdxE9hAFTsCSgtOcM0apRktahVG2zOiRtWb_XUGXdBh
    GMGGT6VeUK4dWPc88U>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheptdehvedvuedtkeeifeehhedtveehtdejjedvhffgfeefhfef
    feefledtteekieetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghr
    iigrnhdrtghomh
X-ME-Proxy: <xmx:NSnMYjabl2qLg-4K21Hpt1eGmgaLrP0QH8Jty7WswgpkF6eV1DfjfA>
    <xmx:NSnMYiUGq8YRBmX4sWUPyeKAJiSw_atoFLEvhU0xg8K3VTyULl-fGA>
    <xmx:NSnMYhmgtjqqzmapn3DgiEEfqmGeTY65gqH-U7Z4kYzCjQgbng0HdA>
    <xmx:NinMYhvRjM4Er0Egjbum5cFUkTPn_H0N7y-eE7jQ-HJ1J-H5jh80JA>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CA5A0234007B; Mon, 11 Jul 2022 09:44:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-720-gbf5afa95ff-fm-20220708.001-gbf5afa95
Mime-Version: 1.0
Message-Id: <38b4f487-5a1f-4542-a533-ac32b7482093@www.fastmail.com>
In-Reply-To: 
 <CADkTA4NiCLaqUR5=odkgpy41-oQD5oXSnFGgu45qLP+ch7ebbA@mail.gmail.com>
References: <20220711130022.3264142-1-andrei@gherzan.com>
 <20220711130022.3264142-3-andrei@gherzan.com>
 <CADkTA4NiCLaqUR5=odkgpy41-oQD5oXSnFGgu45qLP+ch7ebbA@mail.gmail.com>
Date: Mon, 11 Jul 2022 14:44:00 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>,
 "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization@lists.yoctoproject.org,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][PATCH 3/3] podman: Add support for rootless
 mode
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:44:30 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7433

On Mon, 11 Jul 2022, at 14:38, Bruce Ashfield wrote:
> On Mon, Jul 11, 2022 at 9:00 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> ---
>>  docs/00-INDEX                                     |  3 +++
>>  docs/podman.txt                                   | 15 +++++++++++++++
>>  docs/podman.txt.license                           |  3 +++
>>  .../podman/podman/00-podman-rootless.conf         |  6 ++++++
>>  recipes-containers/podman/podman_git.bb           | 15 ++++++++++++++-
>>  5 files changed, 41 insertions(+), 1 deletion(-)
>>  create mode 100644 docs/podman.txt
>>  create mode 100644 docs/podman.txt.license
>>  create mode 100644 recipes-containers/podman/podman/00-podman-rootless.conf
>>
>> diff --git a/docs/00-INDEX b/docs/00-INDEX
>> index 5aa1b3c..6659fbe 100644
>> --- a/docs/00-INDEX
>> +++ b/docs/00-INDEX
>> @@ -11,5 +11,8 @@ alphabetical order as well.
>>  openvswitch.txt
>>         - example on how to setup openvswitch with qemu/kvm.
>>
>> +podman.txt
>> +       - documentation on podman container engine integration.
>> +
>>  xvisor.txt
>>         - example on how to setup Xvisor for RISC-V QEMU.
>> diff --git a/docs/podman.txt b/docs/podman.txt
>> new file mode 100644
>> index 0000000..9f35501
>> --- /dev/null
>> +++ b/docs/podman.txt
>> @@ -0,0 +1,15 @@
>> +Podman
>> +======
>> +
>> +Rootless mode
>> +-------------
>> +
>> +Podman is a daemonless container engine that has as one of its features the
>> +ability to run in rootless mode. This requires a set of configurations and
>> +additional components. The OE/Yocto integration configures podman with this
>> +support enabled by default. This can be changed via configuration files
>> +(distro, local.conf, etc.) or bbaappends using the `PODMAN_ROOTLESS` variable.
>> +
>> +To disable rootless support set the variable to '0':
>> +
>> +PODMAN_ROOTLESS = "0"
>> diff --git a/docs/podman.txt.license b/docs/podman.txt.license
>> new file mode 100644
>> index 0000000..940435e
>> --- /dev/null
>> +++ b/docs/podman.txt.license
>> @@ -0,0 +1,3 @@
>> +SPDX-FileCopyrightText: Huawei Inc.
>> +
>> +SPDX-License-Identifier: Apache-2.0
>
> I haven't been following along closely enough to the copyright thread
> that Richard started, but these jumped out at me.
>
> Aren't most of the .conf files considered MIT (i.e. part of the meta
> data / recipe space) ? And are we putting copyright's in conf files
> and .txt files now ? I'm definitely not an expert (at all!!) but that
> doesn't seem quite right to me, when they are configuration files that
> follow standard practices for the packages we are integrating.

That is definitely my bad. It should be MIT. I'll re-push with the changed license.

This is following the reuse.software compliance. I've used a separate license file for the txt one so that I don't affect the actual documentation if they get post-processed in any way afterwards - there is no standard for comments in txt files. This is basically saying that given that I don't want to touch file foo, I'll create a foo.license file with the extra SPDX metadata.

>> diff --git a/recipes-containers/podman/podman/00-podman-rootless.conf b/recipes-containers/podman/podman/00-podman-rootless.conf
>> new file mode 100644
>> index 0000000..2aca663
>> --- /dev/null
>> +++ b/recipes-containers/podman/podman/00-podman-rootless.conf
>> @@ -0,0 +1,6 @@
>> +# SPDX-FileCopyrightText: Huawei Inc.
>> +#
>> +# SPDX-License-Identifier: Apache-2.0
>> +
>> +# User namespaces are required for rootless containers.
>> +user.max_user_namespaces       = 15000
>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
>> index 961cd18..2680f40 100644
>> --- a/recipes-containers/podman/podman_git.bb
>> +++ b/recipes-containers/podman/podman_git.bb
>> @@ -6,6 +6,10 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
>>      `alias docker=podman`. \
>>      "
>>
>> +# podman can run in rootless mode with the help of additional components:
>> +# https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md
>> +PODMAN_ROOTLESS ?= "1"
>
> Isn't there a way to do this with PACKAGECONFIG ? We could just as
> easily check for the option in that, and then we have a place for
> extra rdepends, etc,as required.

Good idea. I like that. I'll change it in the next v.

Andrei

