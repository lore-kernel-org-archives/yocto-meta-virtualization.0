Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A944C982C4
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 13:59:18 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15608.1789567151307311710
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 06:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EBaoXLXG;
 spf=pass (domain: gmail.com, ip: 74.125.228.140, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so151925666b.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Sep 2026 06:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789567149; x=1790171949; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=EBaoXLXGcqR7dWth8eV1JHZWwpQbADPtqo+YEh9WDma6MIsKzzKfiSfbQIeEpWaMU6
         hT48c6ltQGVxqJpNZ31JxstzehNKBP2xnWYVAxkXvGiF21msyB/rMvQzhbIkh4NRxqfB
         N0ZI0mr+p9mq+2aQd1vDg9O3ZPHyUirvjT6cC8cnpbeXbakXsLPvDo2IIRKlJ5v/HowG
         CMYWH1B2B55C8wR0NrN08dF8iXrQTsHQHhx8jHJt9gC5JFfIJV/cobLG/amN6Rf5Kt0S
         2dVX4HM1xuuerwPd4ldmEdfE5maeUlmoBQtglmALD2QHQP8FtLcVsw08Q1xhkX9KoyD/
         KKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567149; x=1790171949;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=wN4zpHgYMfncHq6/fFYifOuN8PlxyIejx0NKubWbPaw6IWrOFEyskRHU+Y2zwwLDlr
         YvvILEutDOPeOE6eGJq1xZHqm6AT/ZWva/Jnyc/Psb/Iy9lCNDqnmCaOyVmv/e+VeuEr
         /6wNx/tDX8ij4UxBpa/65WkAb1s3qEGHw2WdTcrwfDdIqd0qDD+1u+0BMLm+15VWDLFs
         +BQy3KctzzX1OgyDQdb4J3cGrpt+P6q9lsAOJZqF8BUTNoOJdQfDaslm4sD+GO16eBsb
         qguu2t11CHPi2j/TV1lpvvOXW5U1ltJ74c/1lk1P/5yEpzmpIhGkk/eFoKL0R2DVLJCD
         8JjQ==
X-Gm-Message-State: AFuF++mCMhyVP2Fc4ppWF6RkNtSJv+Nzjkmf+/zKVjH7CooaMHWQybwv
	yM5NZ+G/8d8fBoOu4bhGV6Sur9oPHWpbPv5EN7l1aI5+two5pV1H2XQY
X-Gm-Gg: AYBFou1yXtj4QRI5AihFrJ9a8NvoFAo1jJ/uZuQ3cP0AUcRJMAOJ543dyCYUscUyrJT
	up/2fpzE2IJKCJVewT2r8dAM2QlTCMxWogw5R6tMMnooeH3jjElhe5DVJ6kYMlLLVaNq7ozJ5/T
	it+8LfuEEpPBwNMp5w820VJCTZDlrMJy7PA1r9nWLYgTf2MFIbOCgTRCdEMeX/Y1pLz33p/KQIf
	oc1+tXmZ9R1ZuYZthEKlDyy1GJZwut6hdVkM3XfZijVaycKk0F2fP2pY/TgVpG0cdhRnfoKna7f
	Mev4YxuWl5uvYoBSN1MFaSlhvGLnjqZwrkjdGQ+qklT+X2rxJIIjJh2QBAjgUw7vhwC9R3jyYx1
	C1on2DbeNriSjPiTfw659bVdgXABKNY8gM/AuHTQ7i+4QIiL6BQrEMC6BG+FO2Gmn84Jw7gIG1X
	OnCTsE6KOK3fwQpS9ncqP3F81schcpEnVyTdXsjJrbWk9Usg1nLzfjHw04auf6wyjnlN1W7f+nM
	lI1AdGMmG9x5FI8ZzZ/ohAf5CsnipMuI8pu94Mg9yE6g3kEasMx5FKEN/DBZRjNO0p+hOzgxT8S
	yBvX4aK3HvfsYNoxmnIbRR8O4Z88QtB0vKrppCQBPOgIZRTT31UuaN5UFIT/GeW4ST7hOY966bm
	RaO2Dyw==
X-Received: by 2002:a17:906:6a03:b0:c29:5b0c:1b44 with SMTP id a640c23a62f3a-c29e53d53d7mr199307766b.37.1789567149408;
        Wed, 16 Sep 2026 06:59:09 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453f04sm145303866b.15.2026.09.16.06.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:59:08 -0700 (PDT)
Message-ID: <6aaaa0ac.d2476c94.326974.4a7e@mx.google.com>
Date: Wed, 16 Sep 2026 06:59:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hthakar@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][scarthgap][PATCH] grpc-go: Fix CVE-2026-33186
In-Reply-To: <20260903061155.3709114-1-hthakar@cisco.com>
References: <20260903061155.3709114-1-hthakar@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Sep 2026 13:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10080

merged

Bruce

