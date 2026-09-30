Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045D9CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:56:08 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17003.1790783765843698745
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 08:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TtrbDBNL;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530de452c33so50929251cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Sep 2026 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783765; x=1791388565; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KJwfZA7W5DVaGtwdFPckPhc9Bqxpqz94NLq2qppjihk=;
        b=TtrbDBNLxcUQLEu7sPQlZQLWD9H/waJ6xVupNK+rKuvl73GgarW5G8Y83Lr9eJQbMP
         gT5OQI23hxCHs0I8cCnny4eh4i5c1aKKFXSOUeBkVGFAZvg/wLR3R1eAWodcuFGw4/Fq
         1osy99L6Oyh/8VlD12UQJjt8V5k2RtlXPbaBbJTT9q+RFT4issB/4iAVmbyJmoeTyLpH
         qjU3SKNveNshLu37qjaZ1QV7QDlaROeBoWJP1OcjiNeUfx9oJwKLcBIbKO/wMn4Pho7Z
         O3YnfZjZr8HCbf5RvKO3kDoYlSprPF8NrbtyI2b2252WDYyW2HXuvPY3Q79BlcfjScbn
         LFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783765; x=1791388565;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJwfZA7W5DVaGtwdFPckPhc9Bqxpqz94NLq2qppjihk=;
        b=0M+4v54pgjrljRGuFn1K3apbk9iRuRVONxyTJrTUnSWpeAL5h1QP3xymXArY52LPWY
         AzPASSyGxEG5lA2IOeQAphu2PtSP1M7AgB1bKyBv1qHDrgK7Q6egNxhQyQrN3ux0VWzK
         6Gh7pTfzrB3rn9c8KKA/P4BKwE9ML7iXxTktEaZ2/1fPAmf5v6K/HFw/IinCrejLv9ko
         s9Ch8/gtDo4poIBW8leYJPnBUsoxVyExDixvtOjTT4dOhW85Tg00RnLIFRDcRO1iycia
         m4PxzsrDxV89RzJt4HYvsjkrji8LqXyTTbL/rAYVV5n1S3VStfjKQjlHl2RFQNwah/Wm
         NYig==
X-Gm-Message-State: AFuF++mvWH+f79qQ71CiUiLd4xWDJ0xVAKU7MabS4LTlT3pL/c73DpVO
	G74XiR7kWR68ROhxNxgdaYEakO1AHQ+BfUmZHBBnJU6fJyO+B4ZbkB8kajlRmucM6+I=
X-Gm-Gg: AYBFou0IvERd4QFe0j5MzEt59onw6cNsfgAMv1aa5kVc1YlTO93gNKYxwKeHdPF3EDL
	wrbfcYIaTLz99pErrZ9WrPEvGZauhDFmNoMX9dlQZ4xvduOtZ0eA7VKcPYyydwYGGgQzkHBhBEv
	KOC4CdYbAC3SnjmYd69+v6GotXVGHk6ORfAiSh2tEYBmpdKKdYZKfk2b7yCOATOU+qkptd7pUeK
	FUuwb54u6iPRRnXC5pjJ8/zxu66xW9XfXdVZhvo00gQYhPNg7dtWsyVpZfu6dsIVh/dOSZ5yePl
	Nry4soSMykwJUxH84z4FflAtYGdKwViai1yvL+pAilClALMsZo4Sfnd1nCvivqbQFQzk4RE36qj
	z3yWWKmJgALMi5KfY3T9mCWGOPAurV/7rC01a6xeFICN6hCUKc7Hi22wEebfmh9nOQCgygHVh5Z
	6zxDKWhVrWmHGNTIq51dCkw95iIT3NL18E2VeDm0bxF1B6tZNUW7DFmXVTFtgIwrnjLlCdWtut6
	SgZQMuuGlVNIXvOjliN4I7/Hlob4fQTE8mp4dayF2RHDAftyV/Mb2VO/C48ftqjMjdFVGTHXmoZ
	iS+yIkktGkLLd48wV+c6GEmUwX70/r3egv7Z5azafcaiZT1Z+aODbiM/BTtJLzqcCRmbbCo=
X-Received: by 2002:a05:622a:6092:b0:532:99e0:5a14 with SMTP id d75a77b69052e-53373c9ac08mr36281141cf.4.1790783764568;
        Wed, 30 Sep 2026 08:56:04 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89a52e1sm2953506d6.13.2026.09.30.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:56:03 -0700 (PDT)
Message-ID: <6abd3113.e51cd04b.1fe4c8.0684@mx.google.com>
Date: Wed, 30 Sep 2026 08:56:03 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: tanguy.raufflet@savoirfairelinux.com
Subject: 
 Re: [meta-virtualization][PATCH 1/2] image-oci: add OCI runtime bundle output
In-Reply-To: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com>
References: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Sep 2026 15:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10100

Hi Tanguy,

I don't want to take this as it stands, and I want to be clear about
why. It isn't the mechanics of the change, it's the architectural
one.

But this is a good topic to discuss more, since there may be another
way to get what you ar elooking for.

Sorry for the long reply, this is something I'm currently working
through as part of my OSSEU presentation (and next release planning)
that I'm doing this week.

image-oci exists to build OCI images. If a use case wants an
OCI-targeted container, the "sanctioned" way is a real image recipe
with the appropriate image type set (IMAGE_FSTYPES = "oci") and the
OCI_IMAGE_* variables expressing what that container is. The recipe
is where the container's identity lives and where it can be reasoned
about, audited, patched, and rebuilt.

I'll risk saying the obvious, since this will go in the list archive
.. and it is worth being clear about what the two outputs actually
are. The existing -oci-dir[.tar] artifact is an OCI Image Layout
(blobs + manifests). The patch's new .oci-bundle.tar is an OCI Runtime
Bundle (flat rootfs + config.json). Same container in two spec
representations, aimed at different consumers. Image Layout for
interchange (registries, skopeo, cross-arch manifests), Runtime Bundle
for direct exec by runc/crun. `umoci unpack --image <layout>:tag
<bundle-dir>` converts one to the other in a step. So the patch's
output is a strictly-lossier view (no layer sharing, no multi-arch, no
registry push) of the artifact we already ship, produced at build time
in a way the deploy side could have produced itself.

I can see some value in emitting the bundle directly. But that piece
is trivially scriptable downstream from an OCI container that's
already built: one `umoci unpack` at deploy time gets you there, 
and doesn't have to be baked into image-oci as a build-time output
to be reachable.

The part I object to more strongly is the modification-to-make-it-
runnable half. OCI_BUNDLE_POSTPROCESS_COMMAND (jq-mutate config.json,
or drop config.json in from SRC_URI) is hidden logic that mutates
container output bytes after the recipe has finished expressing what
the container is. That can't be a first-class output of the layer.
First-class means the recipe/variables describe the container end-to-
end, and someone reading the recipe can tell what will land in
config.json without also reading a post-hook shell function that
patches it afterward. Layered together with the 2/2 pattern
("require app-container.bb; OCI_IMAGE_BUNDLE_OUTPUT = 1"), it's a
way to define effectively a new container by appending post-hooks
onto an unrelated image recipe. Every image-oci build silently
becomes two products with the second one shaped by hidden logic.
That's the side door.

One clarification on the code comment you cite as prior
encouragement:

    "We could make this optional, since the bundle is directly
     runnable via runc"

That was less about promoting the bundle as a first-class shippable
artifact and more a note about reuse/sharing between image builds --
"we could keep it around instead of rebuilding it every time" reuse
angle. Reading it as a plan for exposing bundles as standalone-
runnable outputs via crun/runc goes further than intended.

That's the reasoning, now to the path to hopefully a solution ....

One question that would help me understand the motivation of what
you're after: is the goal here to produce multiple containers from a
single image construction, and the bundle+postprocess pair is the
plumbing you found that gets close to that? If so, the current patch
is still 1-image-to-1-bundle so it doesn't actually get you there
either, and that's a different discussion worth having on its own.

If the goal is just "1 image, 1 bundle, but with config.json tweaks
the current OCI_IMAGE_* variables can't express", then let me know the
missing knobs and we can look at adding them as first-class variables
in image-oci (the recipe-level path), rather than as a post-hook that
sits outside the image-config machinery.

If there's something clunky or otherwise not working in the image-oci
output, then that is also something to look into fixing. But if we
still require a recipe -> produce one output, then I'm missing why
we need a change like this.

Cheers,

Bruce

