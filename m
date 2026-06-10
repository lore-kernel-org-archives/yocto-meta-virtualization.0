Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1F8CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:28:34 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27936.1781116106031993702
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XsK3i+WU;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-517654b8e28so52917711cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781116105; x=1781720905; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqKSKaRab4HXOWelcQBVmbBmOllzTZQqzCZl+P6opAE=;
        b=XsK3i+WUlrDnwvqCMITc9xkxwSOBcCTCUExK1CjAzB17rhtC3uWR1Y/p5kPZX+7WR3
         Cqx62g7+wlxUQ0wJ/bRJnNPG+kQsw0wPWmE5ZEu5r2kHJG9beTL4SA5spPbO9YE0oIPG
         PCXcjI3/sSjV+ve1En4lfLBmgLr6EVsvtJdI9oR9cttMrAP71PslmdIhQGjNGXB3asbJ
         EaH5qc/T1Pm0JSjIAkaZRkRlb4vsBBR1XoGbxX8IjW/msMGdlWTwWGsdJFXAj3ipOKlN
         0QWxHgC+2WtLeolT685/I6PYSSi2EBqgP6Up0QtU/Gd6P4l8LJVxk5e8oAds1dncILcN
         iweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781116105; x=1781720905;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CqKSKaRab4HXOWelcQBVmbBmOllzTZQqzCZl+P6opAE=;
        b=ZEfeilT5rviEj7NjN+rZT095kTyUXKt9rBxoE/yhDLSt5o9MJsXHWHl3Ly1bDMgYwE
         iHWdtTYSEFLTlfhYlBm3RUMm5Gx4P29//99M0IJKoOanamo8capjQBE0NBpH1n7rLqSz
         +PBOghKqvoZLhDGX3r+0rcSauIZ1f8ClA5BPsSjKdEqDbDxTAq3HR7sNQj8G/hxTZZcR
         rRPrKXVe3RpzfqQNqhvyiewgLB61tE1q7sNdS4fprLLb2IC9c+oHJXXWL/mU7usT3W3r
         BEzB8mNmUDWPn1f/v4s1cIvRpWsAV0Qog6xIgNue27Pv7cWsn5vQaPT63lX+3s8ehX1Q
         keLg==
X-Gm-Message-State: AOJu0Yzz4eK3+7RVxEJ1i3K2QlA2PmSG3YIF6EvDB+7tXPDJFgzpjjtu
	GI1iF21ULk62XqbOkTOKwVCI3qCBT3kZMjIpA7RBo/tKt6rzoS5uF3AR
X-Gm-Gg: Acq92OFX2jrbHpCDjd2NO+DFjJoXFt/c92Q6Y5WhxbX3ci2g/8TAVR1CmntXWwQW5mb
	c3qNRzlNzCsmK0ENw3NSrrKfT0Jawz4cjWrPhBsVNtz83HJtiKPvVWZ0CJq0nJrDOk08JFULP3z
	fqN4JN7i/JKsWrsv88YEfpgdXdHpUHWkPYpyWO2JJdumuGp4j6QWgufry+6yUkWF5cRbz3PsuOp
	2cWDCqn2Fjt26qezUaHsHkl5QR7sYauWXCNTL5ZREnndoe7L2Xxrw4dN95yOE8FxC6ADnoF0iMp
	RHzhpH8Q2Oi58r4YDNE1hYzaFR+k0iMEpmXpYr4IGXMPlMRUrN/7e/wYXhy+G4EOMERZjMMNf+p
	NQMSmN8kr2pdE53CTIqo/zBxW7Rd/k4MxPqJ+VGa+NObVy/R/wYza4TlGwbgvDw1owTFJd6PyIq
	7zmZV1rKEQjpvBtaI5VEbYLDXaJG7DUNkdFsLBYlR8Out8HTYuHb/4uFgnIGFWLUU11nCppcsX9
	LWZL6aZ1nkXlQdLzNkeQJfAIZl7rdOuKjtEH17mzLZlw+tT8KyzJvawNJmCfg5CNOspFsoz0BvU
	N6Bmg2GDnoMEq72BX+LqwoxENxb7SQFsQ9E=
X-Received: by 2002:ac8:5882:0:b0:517:71d2:37d2 with SMTP id d75a77b69052e-517ca3ddd84mr130219031cf.0.1781116104851;
        Wed, 10 Jun 2026 11:28:24 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c54177sm243117731cf.12.2026.06.10.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:28:24 -0700 (PDT)
Message-ID: <6a29acc8.bfbe2361.a2190.4b92@mx.google.com>
Date: Wed, 10 Jun 2026 11:28:24 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: adongare@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, xe-linux-external@cisco.com
Subject: 
 Re: [meta-virtualization] [Scarthgap] [PATCH] go-distribution: CVE-2020-29591
In-Reply-To: <20260601134811.52832-1-adongare@cisco.com>
References: <20260601134811.52832-1-adongare@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9861

Merged into scarthgap as 63fbdfbf.

Thanks.

Bruce

