Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA5FC61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:29:40 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.10314.1677158970670312327
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 05:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NeNrPxtB;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e10so5229719ilu.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Feb 2023 05:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PDJFh921WHW0IGPrzbdihXYxRaZjM4n2YyU2uDPcyDk=;
        b=NeNrPxtB2PN/DZm3LoVwnYJqvtH2ZairQHEOK54m/6EqoG75a3Vk9wEY7R83xXboCH
         k1Q0p+cv+LYTTzyDD9ztxvU+AaRa+j9ReBJvOYQ/kCUjf6yoltwPmQTWztN++ZftSyUc
         mTH+MfA8Bv1Da41YB05uP0dGtUiHJV7HR6tL9wDoZtm28UK+x/hr2ayVskCIQpoi0O9Q
         i/zQPoSWOpg3lqd7k/NdeB/lIZ0ADHIVrHfzryjynhoIuwUypTbjvgwobxDg1t8QYEIT
         Jbzl1nfyimiQMLtU5HNxleJLkKVs/7UYKa6dFF4+8oY9HKR6RcJjSgWmdylzgVVWnWWv
         Y+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDJFh921WHW0IGPrzbdihXYxRaZjM4n2YyU2uDPcyDk=;
        b=KgEoA6Vc5UFz09ZpY17kgPFk+YrctlLjte78X3DUfeilttzUC7BuQlbdqDf5FN4kwQ
         Ig6YeMyynU8e+kfe6nky7CaO9xA1lXJoiSyt6GgC/Sz4jYgMiWP4znEFfNOu/Ef1Wyfw
         /J+MRCAhQPD8sN5lgoUjFI09w6zhmfEXED+jNZ0yZ+P1VNHMkuQAan49DDwV4nZw3qWc
         79J+ebhwVXNV7IloSRm4s07GjFOS+hRai005u+lsqOkfyF6iE9RIs1JMaDMiXVU7ncfC
         Um0eQqZzdqvpqOJCRzOU1ZqESLpLtR7NnNYQRa6LFr8+k6iecgq7sOi0QufHC0ccab7i
         WplQ==
X-Gm-Message-State: AO0yUKX6AqwhlgZP2EScv+nnEZYOOhH4K6kgs5LV9bJsssnWLRdf2EF2
	ERYQ6C6dJShYMT/ZZtVoXJ94rWDh5r8Pd5CfFkY7xXrF//U=
X-Google-Smtp-Source: AK7set88HSYzi+bD9FohZXvktvK3ohbGTII1pr+P/jBkj1lO4QJklfue9mFzwdSDYUEIBtlgwIEV9/nYjNvb2v47F3o=
X-Received: by 2002:a05:6e02:f02:b0:315:9b88:a50d with SMTP id
 x2-20020a056e020f0200b003159b88a50dmr3183003ilj.0.1677158969580; Thu, 23 Feb
 2023 05:29:29 -0800 (PST)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Feb 2023 08:30:19 -0500
Message-ID: <CADkTA4Nne7FGt6twF9MeJ7BxhGwmPCM95840xSDJU_7WkpD6Zw@mail.gmail.com>
Subject: go breakage in master
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Feb 2023 13:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7896

Just a heads up that some of the go applications are breaking in master.

I'm aware of the issue, and have a general fix in progress.

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

