Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C693CC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 13:55:56 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web08.22220.1657720553657063579
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 06:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=OLmBxHmv;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 05BEF5C0240;
	Wed, 13 Jul 2022 09:55:53 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 13 Jul 2022 09:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657720553; x=1657806953; bh=h3zS0E38f+
	/9q0fv5GYm8JL/+d+VkANO+ed0RajF728=; b=OLmBxHmvaWEsoP12ZYsdGyQyIq
	p5xvCdhhVuKTFSvXDBBE1h1mkwnDHQG27NoqovDnT5Kryr4LaX3HD2enrIZuChOQ
	aZx33nZnTjhsBDRBtoW4eb8OCRc12L3caG6VFp39JK1d3wllw0XMcKYK/71L2WOt
	vIgr4ByJI2BU3EXC7mnk7+ymQYFFFu7cVas3MUdU8xc2b8MaUiwUh66QgpT0RL3H
	XAWmmLOf1itaz7zEdr4xMivHdqri3VlIbHeDEI/7xguPqph5cv5jZqhKlgDR+cYV
	b+OZN/4uoOaWcGegMbrIl6BY58N7WBQib5cWFhnzzAY88IvnN4hhU1J376OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657720553; x=1657806953; bh=h3zS0E38f+/9q0fv5GYm8JL/+d+V
	kANO+ed0RajF728=; b=stak5YDT+W1CADUnDTovOa5lNckOuu2DNXf/3NsKFDCl
	qjX+RofB9QGmv+bxeQ+PkjaQCYqUO0a8K5gMVgjf5jcBAtxn35B9seb+FZ2FOQqj
	DXFOVlko5DJyv0wqLYcz0T9aTai/3IAcIpPoWpOsiQzRlKCdo0K8ZdOWYhS9Uuxh
	MJMRD4ae+d2Yzlvrcd+TK1ChV5mTCG7SZefLbBMbIoepksC2YyD00+TbqhJMxGBO
	adeO1JN/QMX4fdZe3MH0cWzykykTh7/syOZ7IR8R5wWBxQ63RQxHK7NG6Dw33h3E
	kazjyFtMQGf+smbrz1WbhybjU6gMHAxRZxfFpkOQDg==
X-ME-Sender: <xms:6M7OYiLdkcrahSOxenitPQUGK0QtKQH9pBCncsoP-WEnHMXJ3DTm9A>
    <xme:6M7OYqLPFexWte3-Xtb_7QJVC06ya9_t8mJWqkrsgISohL_CHiWWm5yBHIcg3dtvw
    y7AX_nxBOnrEQlvq6k>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheptdekvdegleekgfffjeelieegjedvudeugffhvddvtefghfeu
    keegfefgfeehveelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdphihotghtohhprh
    hojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:6M7OYitMjfpB9EDfLJwTZOGpOcO41a09nvJRUD9yWZ4t-x6TYxQa4A>
    <xmx:6M7OYnZ8H2f8XaniZrchGIrwnX7xRTTeAEoUkLGgBZomtjjiom2pKg>
    <xmx:6M7OYpbGRX88iYzeEbXvtVBJ4f2csdS0npvNsAcul1jHlplSMUSQfg>
    <xmx:6c7OYqCjCe7Cw1nTkCxF3cNtnMAckE56AALVFetYBlgvDOnDJ4yHxA>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B8DB9234007E; Wed, 13 Jul 2022 09:55:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <dcf31062-d390-4907-9013-32d4ca34d550@www.fastmail.com>
In-Reply-To: 
 <CADkTA4Mx3gts_+4SHqOZJ57RDzvwXoN0-K7XJhQz6W_7q3OWvQ@mail.gmail.com>
References: <20220712141719.879382-1-andrei@gherzan.com>
 <bfc46925-3e47-4c98-96c2-0faf8f89ab06@www.fastmail.com>
 <CADkTA4Mx3gts_+4SHqOZJ57RDzvwXoN0-K7XJhQz6W_7q3OWvQ@mail.gmail.com>
Date: Wed, 13 Jul 2022 14:55:32 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][PATCH] fuse-overlayfs: Update to v1.9
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 13:55:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7456

On Wed, 13 Jul 2022, at 13:56, Bruce Ashfield wrote:
> On Wed, Jul 13, 2022 at 6:24 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> On Tue, 12 Jul 2022, at 15:17, Andrei Gherzan wrote:
>> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> >
>> > Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> > ---
>> >  ...-Fix-buffer-overflow-on-workdir-path.patch | 32 -------------------
>> >  ...erlayfs_0.6.4.bb => fuse-overlayfs_1.9.bb} |  7 ++--
>> >  2 files changed, 2 insertions(+), 37 deletions(-)
>> >  delete mode 100644
>> > recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
>> >  rename recipes-extended/fuse-overlayfs/{fuse-overlayfs_0.6.4.bb =>
>> > fuse-overlayfs_1.9.bb} (60%)
>> >
>> > diff --git
>> > a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
>> > b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
>> > deleted file mode 100644
>> > index 129423d..0000000
>> > ---
>> > a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
>> > +++ /dev/null
>> > @@ -1,32 +0,0 @@
>> > -From 7e5992d6121aed0cfcbfaf70472f28d87cff1426 Mon Sep 17 00:00:00 2001
>> > -From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> > -Date: Mon, 11 Jul 2022 20:36:06 +0200
>> > -Subject: [PATCH] Fix buffer overflow on workdir path
>> > -
>> > -We make sure that the path used for workdir is reallocated before
>> > -appending. This was initially included in upstream as part of
>> > -https://github.com/containers/fuse-overlayfs/commit/d5b725b6f18a437db66bfc1456d04c3bf658f66a.
>> > -
>> > -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> > -Upstream-Status: Backport
>> > ----
>> > - main.c | 3 +++
>> > - 1 file changed, 3 insertions(+)
>> > -
>> > -diff --git a/main.c b/main.c
>> > -index e5bdda1..118a6cb 100644
>> > ---- a/main.c
>> > -+++ b/main.c
>> > -@@ -5039,6 +5039,9 @@ main (int argc, char *argv[])
>> > -       if (path == NULL)
>> > -         goto err_out1;
>> > -       mkdir (path, 0700);
>> > -+      path = realloc(path, strlen(path)+strlen("/work")+1);
>> > -+      if (!path)
>> > -+        error (EXIT_FAILURE, errno, "allocating workdir path");
>> > -       strcat (path, "/work");
>> > -       mkdir (path, 0700);
>> > -       free (lo.workdir);
>> > ---
>> > -2.25.1
>> > -
>> > diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
>> > b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
>> > similarity index 60%
>> > rename from recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
>> > rename to recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
>> > index 4f793bd..18e9dfa 100644
>> > --- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
>> > +++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
>> > @@ -5,11 +5,8 @@ containers."
>> >  LICENSE = "GPL-3.0-or-later"
>> >  LIC_FILES_CHKSUM =
>> > "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> >
>> > -SRCREV = "098d9ad79fdbb8538adde08628408aa32a8b4b17"
>> > -SRC_URI = " \
>> > -     git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https
>> > \
>> > -     file://0001-Fix-buffer-overflow-on-workdir-path.patch \
>> > -"
>> > +SRCREV = "51592ea406f48faeccab288f65dcba6c4a67cd90"
>> > +SRC_URI =
>> > "git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https"
>> >
>> >  DEPENDS = "fuse3"
>> >
>> > --
>> > 2.25.1
>>
>> Stand by for a v2 on this one. It needs a musl fix. Also, do you see any issues in using 1.9 vs 1.9.0 as a version? They both are semver compliant.
>
> Ack'd. Holding on the queueing of the change.
>
> I don't see a problem, I typically just follow whatever the project is
> either putting in the README or their git tags.
>
> I just did a check, and indeed, they go with v1.9 and then start
> adding the .x after that .. so v1.9 is fine with me.

Sounds good. I've sent the v2 here https://lists.yoctoproject.org/g/meta-virtualization/message/7455 but I forgot the v2 subject mention. I can resend it if needed.

Andrei

