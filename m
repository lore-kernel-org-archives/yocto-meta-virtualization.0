Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD0FC55ABF
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 22:01:51 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6787.1785967309243856052
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 15:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OJ/WtJDu;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92edb12cdf2so102104185a.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785967308; x=1786572108; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myTQxq5N1GnNi7+3zmEKGZRDpH9FQBxuSC5hf44i05Q=;
        b=OJ/WtJDuz1BYdftGjbFXMe8X30ZqD7J3OVU4xHsLwuHTKJIWbpLRFvaN9qlU4rq78M
         RkS5XTeM2quhZhPo/cqLtSqpvuRPxIL+oR44NLHzVc2wi9TNjRLV/pq7lz/VH0PSH3ad
         1xVCscgTChEMjoDFvTJQSeXY1mkXXx/YgXysRApHGA34fBnMsD9GOtIBEdNi+0fQ9k5G
         4AW0O6eL5MbqimVXEn/ntRBXzm8SsjElh9rGFfyA9uOvdLBhCPT26eBHA6ppQJXElYc/
         w8Jx9PjHRzhuHwPUnGGGpP/0FbqDUJw93jpJGwcM87NfiMom+69YZT21zKME6wKEozxv
         0gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785967308; x=1786572108;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myTQxq5N1GnNi7+3zmEKGZRDpH9FQBxuSC5hf44i05Q=;
        b=bHDnzAR6WaBXFJ+3dpDvQ0dbKAXEEAE7KKptZ+Hgdq0t9uHz3QBPRUZxYCb/RmeRjQ
         hGlgmmJblNtD/jvLBg/n8QQQ4MJZ7Rr+OyKxtRhVF5IF5iAVW9eq6Zv3eNZ+/5flh8zB
         f/9tVxR6rtqePra0J4ZErYy8bmnrZs7Dz4+2dlbeOOLiyW2R0Q+9pzhQhuMM5UdYOHwX
         jbwT7EkwAXTSgbAuEXE4LPrTUl9MJRHP7OZf101rg2hvU6fv5iKKocfukXF8UfWys41x
         TeZBR9KVppi2t8F2VtM5WchvHiNBof8oPevDYf53TGbaUhzZVFCjRbf468l0yLAbO7b2
         2FIw==
X-Gm-Message-State: AOJu0Yw9qh7oMw+fo3ukugJ9NsB7kM9zA2YH4UkrUMg3mFRBOJ0CafhI
	u38KO0Xde7f91PPaPLszBrbETh/dU+5rSdS4E+lklLOTT7tcJyn21xJ7SGtJ8VTd
X-Gm-Gg: AR+sD112kKnqFbWC+4iiRdd9rexRNvWtuhr5FUXKXGrGPfCYVBaNG66GaMFOchPG4Nt
	/8g7zfQZszJoi4jkPAmcJDNQBA0MzKNUQJ4jEiDHMv77EReG45DoEhbybECFonGiyvrnfoiiA3O
	qKYzNx0XkSWUDNuX+AihjGTYb2Fy9eyu+FIK9hF+oex9kUAMkdI/8E46UKSMfoF2p6jultizHBI
	KGlSDuhYEsY84unSxd64uV9VmUdnGjcgnE7GoB1VjNEfvIrkMP59yrPeB/L195OhGCqHFtR/J0K
	fuy7fEnxvEIVAi2MbNGZh5h/bQbZXYpMhXX2CtDHtNKxq9rBOXMrfDshH/63FFtnpdo3RlxJHfM
	vm1A2qK6db9i8+ZQHldUaCpMecduZ/H1LTu85gABJ/3aKviFotIH5uuiMlQZ+k8z27D31M76GrL
	SqKKmpwHW6zij/+S9+ksh2zbRQ1ziYf9T6EM3CcHhaKfy4A0vMglYsQ34AS7HXJmAUhdJgFzCb+
	myk+3P/lN+DECP5PHcultsn4wHV8+Ct+APuMqIJ+IWViay1ijfNfWcAA7oitOyDokl8szGNZNIu
	X5mI90yLqGLGZrfGMMrpEwjUa+k1JZEYkYaIt7XnMOdbey2VRAMrq3T1Jd2d+g==
X-Received: by 2002:a05:620a:c4a:b0:92e:fd2c:6a26 with SMTP id af79cd13be357-93649259ec3mr991087685a.24.1785967307767;
        Wed, 05 Aug 2026 15:01:47 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93657fbf6aesm97235785a.0.2026.08.05.15.01.46
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 15:01:47 -0700 (PDT)
Message-ID: <6a73b2cb.2224c765.3e2c6.3dad@mx.google.com>
Date: Wed, 05 Aug 2026 15:01:47 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: remove unused
 0001-messon.build-remove-build-path-information-to-avoid-.patch
In-Reply-To: <20260729001342.1708438-1-kris.gavvala@windriver.com>
References: <20260729001342.1708438-1-kris.gavvala@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 22:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10024

merged, thanks for the cleanup.

One thing worth flagging on your side: however this was sent, the
mbox arrived with the outer From: rewritten to the
lists.yoctoproject.org address and no inline From: header in the
body, so git am picked up the list-mangled author. Yocto's
pre-receive hook rejects that, and I had to fix it locally before
pushing. Two ways to avoid it on future submissions:

  * git format-patch --from ...   (writes an inline From: line at
    the top of each patch body, which git am respects regardless of
    what the list does to the outer header)

  * or set: git config --local sendemail.from "Kris Gavvala <kris.gavvala@win=
driver.com>"
    before git send-email

Either works. Not blocking here since I fixed it during apply, but
worth having in your workflow so we don't have to do the fixup each
time.

Bruce

