Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30DCFF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:47:53 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11135.1777376867119767241
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sVSyutDQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so162644096d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376866; x=1777981666; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y92apJLGyajgGncuZ9hlA1pUG0OGe93tFhtcFGpfvMc=;
        b=sVSyutDQwidZEAp5b3XdoGPecqVBFf2VQoS3I+5r85H7ZnXDxrBBXZ48U67UKPR2ha
         9QkLCaFsv3x/COwnXwjqr0Axxe8Dm1brfWiloEMJQDNvXWOXiwAb3bCyxzHQ4/So0UYk
         JYqwS+r9bvD+iDRouujxf31I1xEq34Y15j+Rag+5dww9ETeHnTb3Bv/7WPwx/8Ap/gNZ
         Wq7cTNwlvPabtIrYBsk/CoFkI3YdCc+RjpsMv9oyMk4EJG5VZRZya66IIuGU693Yj/0p
         r76UPl5UQWXnkdQy2fc55cUv7wYUpYaI9M/QjxYYnE7Y1eGcjBeHc9EsiorK0LkgmK67
         7+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376866; x=1777981666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y92apJLGyajgGncuZ9hlA1pUG0OGe93tFhtcFGpfvMc=;
        b=gc2jHhgC9GlnRARhvnTLm68VE8KCYxme61l8oaoji4vZtlbjjZtbVUP7Htk6XfS9fQ
         EzXF+Kn5npcGtRz/BuA0OK4t9LtrC+1pWuSn5zChohe/HFfnjOshbo3crIH3dBQBbR4I
         LAc0SdY/8/axH/vhK4w3BRLlmNwjaIs+RdC8H1igGPFIVbTh5CZsO5ZADLy+vXaqKLrm
         7tnoqTalPx/y+pZr3VVMKw2TeGMM4Nzh+boO2SptgA3iTwuRr/1s+1HYJuHqEeOCz5u+
         ky6AZXLFM7cUnoPSQaBVmFVU3Nv4KW0JbkydZodsMePIyLrMklsDDg+9LeaDAO9QYcZV
         BBXA==
X-Gm-Message-State: AOJu0Yyrahk/bH+ONqgNPdsauc+3g8fOxi0uBCOdpl5XC5nvTkVTifgn
	QpznBr5F2jQgfg3bZxwRtlH76Twmx9BkzX2NpvxS00hN52tg5CiTyaco
X-Gm-Gg: AeBDieuDSdWmuCzoNvw2AnM/F0Ba5pQDq1egznfy0zUZx1qKGxVOIjAIeh4VH7UkZ5G
	oemg0YZVWphrmSH+isuDl7O144uV+9JrLxISWACICE9kjQtztqkJbGC2TSVGTi25/u+rYh9WyQO
	dXWIIuoXAWoIypF7XTXx4bw8hDNNF4trFx3OFJv5kpNb1hA80LT5s6eTkPefe8JRYfni+d8nFE2
	gFUP7P1qzy+W6i811HAJyG9sEryw3k+fE0r688M6rvt2n6azeVFrePmTnzTNJ6jUU1CstuVaPO1
	B7vctKZLcYlLTGl109yauMuslWZnNMu5kfuqVDfSy2e2zltMw23a1uvWjDqPy9rCNPpLn1/MLz5
	pwZySFbFPK0eYsDkvC521VXZRcr3RRiNSaT7l2uaZGQ8pMxX5YQrG7JgCyl/T6plWfDXRsec099
	oeyLpVNQnXz70XuONDUw4TQqLaAlkkHBB+OACRy8YEVEbnql7F0BSKJa2fUXA5ZJtKWU/VF2qQm
	J4vLHnyTEC4CfU5hB4dj7d2Baaao5XXTuHvLb6C5TMAyYUeGplbgNEGXg==
X-Received: by 2002:a0c:f204:0:b0:89c:e2b4:4ee9 with SMTP id 6a1803df08f44-8b3e31aaf43mr45390946d6.46.1777376866075;
        Tue, 28 Apr 2026 04:47:46 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e2846473sm18159846d6.13.2026.04.28.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:47:45 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:47:43 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: [meta-virtualization][PATCH] test_vdkr_registry: fix
 test_image_requires_subcommand
Message-ID: <afCeX7WSBMP-aBOv@gmail.com>
References: <20260428003340.78253-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428003340.78253-2-tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:47:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9767

merged.

Bruce

In message: [meta-virtualization][PATCH] test_vdkr_registry: fix test_image_requires_subcommand
on 27/04/2026 Tim Orling via lists.yoctoproject.org wrote:

> vdkr.run() merges stderr into stdout (see conftest.py), so the
> error message ends up in result.stdout even though the script
> writes it to stderr (>&2).
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  tests/test_vdkr_registry.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/test_vdkr_registry.py b/tests/test_vdkr_registry.py
> index 9073444d..72a27169 100644
> --- a/tests/test_vdkr_registry.py
> +++ b/tests/test_vdkr_registry.py
> @@ -259,7 +259,11 @@ class TestImageCompoundCommands:
>          """Test that 'image' without subcommand shows error."""
>          result = self.vdkr.run("image", check=False)
>          assert result.returncode != 0
> -        assert "subcommand" in result.stderr.lower() or "requires" in result.stderr.lower()
> +        # vdkr.run() merges stderr into stdout (see conftest.py), so the
> +        # error message ends up in result.stdout even though the script
> +        # writes it to stderr (>&2).
> +        combined = (result.stdout + result.stderr).lower()
> +        assert "subcommand" in combined or "requires" in combined
>  
>  
>  class TestRegistryCLIOverride:
> -- 
> 2.50.1 (Apple Git-155)
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9748): https://lists.yoctoproject.org/g/meta-virtualization/message/9748
> Mute This Topic: https://lists.yoctoproject.org/mt/119041586/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


