Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED4EC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 18:13:12 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web09.32523.1657563183410709092
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 11:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jEcMochf;
 spf=pass (domain: linaro.org, ip: 209.85.217.54,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f54.google.com with SMTP id j65so5652786vsc.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 11:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=/kdUScliGSDyxXkB6ZdnaSG500yHfPzwA+6zWWSMwfk=;
        b=jEcMochfchwn9uKjhUr2s6qLJYQQRsa6cwz3xu7IVNpcMWUTAKMkYsHKhoV6N6zm4M
         8q33lnQ/Zuwh91aW119fX/yxXryajYK0WGiZc1EecnQUk0G2Ne9c9/OTcy13HvRsEtvW
         /b5ia5YKeDqJaFCD9yK4mG2x3c36e/nQpS6aM1MUOkpI7XHiABwX++Fl2T2QNtQRi2qw
         2iwHpobzg3JgkocVm272uj7amADnti9SwzcWthfrexIvtLVd2YxVV8rqt4FV0+Hge0Ko
         koaY+Cu/meEpuvxa2gKfZqeJrXRkji/MRx7FljAGYxbMHOGrskhi0nGDt3Bj1XMq5XsF
         FKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/kdUScliGSDyxXkB6ZdnaSG500yHfPzwA+6zWWSMwfk=;
        b=gDk51KBM/uU2LcooJUvTQ6nYa9H5qdrNa6LaolqkzjYb++i6zcG18etgAf2FUtMVV0
         XyGxUQyeg87N8/axc57Et2whBS195spirnZXzmnKY57v3b6EXsNirbpoIpkRG8At8iLo
         C+sei/W/haaLyZH5xHGFSYYEW16levSp4HPhNQI7o6Mo5Po5apunkmvu0Vl5CO1Yr4zB
         thna9xH7bsGZuHgoxE7vekGxHqvd1ZLKScuYyx3CM9juaNIHeScFqDZQy0iNAKte9JmX
         T4hMcM9aW8cS/vGITxWMwyhIocGxx79tvrn3XnfbmTNhvYTo4HOWE3Hqxl4lwqRZyQEN
         Le5Q==
X-Gm-Message-State: AJIora/X8ZDli+IOvukxF694m3tKdQ4btaY/PfBz+RQ66beKuGfUjop0
	AJEtgfQLJbP0D3dxFMzn0bPHUgLL6YysHxOlhDXSeV24XFaVXA==
X-Google-Smtp-Source: 
 AGRyM1vl2zXB9EEjAlulTBhlH9h7NTSXBB7X8X5Q4RqOScwc9K6+t11ElG0lvqIaiiANmd2k54aStGQQxvfypISys9I=
X-Received: by 2002:a67:e04b:0:b0:357:4556:ca68 with SMTP id
 n11-20020a67e04b000000b003574556ca68mr5122499vsl.73.1657563182409; Mon, 11
 Jul 2022 11:13:02 -0700 (PDT)
MIME-Version: 1.0
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 11 Jul 2022 14:12:51 -0400
Message-ID: 
 <CANp-EDa+9Wa6GntcF6+XU3khNfRoCfhE0cCAXihNHr1Btb2H5A@mail.gmail.com>
Subject: docker/containerd/runc version compatability
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 18:13:12 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7435

Perhaps someone here can help point me to relevant documentation. I'm
wondering if there are some guidelines about which version(s) of
docker/containerd/runc are compatible. I've searched through the
docker manuals and release notes, without finding very many details.

Backing up a step further, the dunfell branch of meta-virtualization
has docker-moby 19.03.15, containerd-v1.2.14, and runc-1.0.0-rc8. This
combination seems to work fine, however there are several CVEs
flagged.

In a somewhat naive attempt to fix some of the CVEs, I updated
containerd from 1.2.x to v1.4.12. This version was picked primarily
because it was available in gatesgarth at the time, I could just copy
the recipe over. This compiles and runs hello-world and ubuntu test
images successfully.

However over time, an oddity has emerged: even with no images
downloaded and therefore no containers running (just the daemon
sitting idle), the system log shows a goroutine crashing periodically
with "fatal error: bad symbol table". It can take up to 10 hours, but
usually happens within an hour, on an otherwise idle system.

This did not happen with the original set of versions on the dunfell
branch. So I'm wondering what versions can be combined? What other
tests (besides downloading and starting a container) could be run to
check that the chosen versions are working together correctly?

Any hints or advice would be appreciated!
Ralph

