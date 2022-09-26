Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81FBC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 08:24:15 +0000 (UTC)
Received: from mail.rpgmaster.net (mail.rpgmaster.net [78.46.222.82])
 by mx.groups.io with SMTP id smtpd.web10.25926.1664180651186037240
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 01:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@signum-media.de header.s=rpgmaster header.b=swrtGTSp;
 spf=pass (domain: signum-media.de, ip: 78.46.222.82,
 mailfrom: g.meyer@signum-media.de)
Received: from serenity (i59F7CC6C.versanet.de [89.247.204.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mail.rpgmaster.net (Postfix) with ESMTPSA id E01212447F
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 10:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=signum-media.de;
	s=rpgmaster; t=1664180647;
	bh=vp2jbByins/ALfneXHqTATrZuN8J7xyfI5Q4+U/Ob50=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=swrtGTSpxklrVczd6Kikplb1+fPX7qQ07M0JpYcBjMxxeYbayxdCrD4ufpa6Y3Wfl
	 aUiJ4GNs3r6mr/PjpGBh5MYqgBI0YKIa5gckHCWj4ZIe2vitCCWCANYXrVOAV8R8ZE
	 e7Jl299b9ATpbt/gq+yq+8FkK/56Gk8cQoIOOi1s=
Date: Mon, 26 Sep 2022 10:24:07 +0200
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] fixed typos in kubernetes recipe
Message-ID: <20220926102346.7a0d6fbb@serenity>
In-Reply-To: 
 <CADkTA4PZY7rBbQwN1AH2D+AWxAqYi5ndmvGwvxmL-xMdPtuFdg@mail.gmail.com>
References: <20220920133406.26b27242@serenity>
	<CADkTA4PZY7rBbQwN1AH2D+AWxAqYi5ndmvGwvxmL-xMdPtuFdg@mail.gmail.com>
Organization: Signum-Media Veranstaltungs- und Datentechnik
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Sep 2022 08:24:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7628

On Tue, 20 Sep 2022 08:03:21 -0400
"Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

> The patch itself looks fine, the only issue for easy processing is
> that it is attached to email, versus being the email. If you send the
> patch with git-send-email, it will take care of those details.

I never used git-send-email - didn't know it - and I don't know if I
like it because of security reasons. I also thought it would be easier
to review/merge a patch if it is received as an attachment instead of
inline.

So what is the workflow after a patch is received via email? Is there
some (automatic) tooling, or what is happening until a patch is merged?

I'm accustomed to using the fork/commit/merge workflow that most
projects with github/gitlab repositories have. I guess there is nothing
like that (planned) in Yocto?

Not that I want it currently, but who decides who will get commit
access to the Yocto repos?


> That being said, don't worry about re-submitting it, I can detach the
> patch and apply it.

Thanks for merging the patch into master!
Will the patch also be merged into kirkstone? What is the workflow here?


