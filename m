Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89BDC54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 13:40:35 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.103838.1673358028061910003
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 05:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lX6MHM+o;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id b192so6088342iof.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 05:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bb7lrWkt0QjGm+dPp8UlwWntGQwsxk5ewIMJHTb15j8=;
        b=lX6MHM+omDIPQ4XFzGx82eqU0Og08mVDxsFAzLQiqc8dtPA4iMMLkKb5wp9iPinbCo
         sNlbGXBlIlI2ZlV4Q2gzPbRPUaTJZeIU5zDLUn+5sYARyGJ3C2HKEeTTAVKCzkO/OLvd
         CfHudJWwwHWzkVhg8Oh5JRCJfauKvEiU7kBAd+ZkZzgvqYe+zcPtIlJsQaOYRhCSWOY3
         YK9tNn9LfLIsRNXvjyHR45urjWzMLlm888pmf4APOTgeVJ9itCmgSJIT8d7jcXdD1EEw
         EObkN57j0tJxePk9z0Rm075nJa7j4Vbg+Dyb6hJ9k3GmRahzJRFtLkg06lpE4ImlRkBo
         IIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bb7lrWkt0QjGm+dPp8UlwWntGQwsxk5ewIMJHTb15j8=;
        b=f9ttPCeebPv0szldCvknKgDPnbgZPpJxqoeevP3vUMwsZCcrvVZHDoPE0Z30W6WHQK
         +9AaYnJ9lnvtNnVulrTd7YDBPrdhUXmPYpBLZ7YXjUWPR5MAHqIiuGsqlfQxU7nWFthT
         1OHyvJRiNyumeRiVRMdntM1VcANrV7LdCJjTCfYHYroO/8rva/W1ofiVy/5crDQjEKCR
         BwQiohkJumHoVp3gVUXDLjSwPoIiihq+T95AW2+nglawHiJmxeRvwUgFHPCQn+BKQ5Bs
         uHBYwQ4hrVk4ON/smvd/2nFka2e1/tEA3DeiDy8WoAtX5LWz6MaodxscZ8FM8NfwJekh
         r6ng==
X-Gm-Message-State: AFqh2kpsbHUMXYjEtIiJYpGf5fyZ/ZRdXK5E6ay+h18IdeS7zCEgYfNQ
	aMCZCQt1HNuSCZMJ6YPbXKxebaH+gWK8qzF28Yhlx38gz3k=
X-Google-Smtp-Source: AMrXdXvRqUKBGTqTeU12yuPxogCxCZ4a/Vc2LzCXLSRVGxyhI4UkFMYLqhsEkKXVgrUq/egbFy3XdHE4J6G7qn0DNU0=
X-Received: by 2002:a02:6a1e:0:b0:38a:c2a7:369d with SMTP id
 l30-20020a026a1e000000b0038ac2a7369dmr6597370jac.245.1673358026982; Tue, 10
 Jan 2023 05:40:26 -0800 (PST)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jan 2023 08:40:16 -0500
Message-ID: <CADkTA4PbzhzeEAuPpLaL3POfY-p-RepyhP8e7NU3tRTQhYHLeA@mail.gmail.com>
Subject: breakage in master
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 13:40:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7808

Hi all,

If you run into go applications failing to build in master, I'm aware
of the problem and I'm working on it.

I can't run system level testing until I get them fixed, so any
pending merges will go to master-next until I sort it out.

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

