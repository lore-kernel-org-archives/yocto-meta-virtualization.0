Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37F3C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 16:05:08 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.72364.1722528303202526824
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 09:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bh6NhJpt;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1d42da3baso495732785a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528302; x=1723133102; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=57lwfcAIsO0Fn+oerqjuTwsaZDaHsJ7x7TIR/+ksIfE=;
        b=bh6NhJptnGI+Gsenbxq47BFjwqdgRLQQ9+EDB21+kLNVcQWUMdKGsQtC2tDvycCHv3
         WNs/sV9etS6xb0M/lWcVhB55C7czLkv25R9lXa8lskXILCl34GUu2TE4tsmkLwAvCIDO
         QEm6rFn920JC5nDD8PdYdDPAz1lxc2QNfPuJNVZjZSSwGKl5HRRUBa6FADjdVbSq1l+D
         1qOjDCwmFwbOertIiLLW1lklTakSYcT04ybmeunhBdJEcdd3oeGHQ4P3+1fLSGzJLo2/
         /2vhxoj2gaAU3zbwVYqvWx7iz1Y+olgqHcNxtrV7Fbbb57cRLac+xPSz9t0eryIr6iuz
         mxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528302; x=1723133102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57lwfcAIsO0Fn+oerqjuTwsaZDaHsJ7x7TIR/+ksIfE=;
        b=CPoRe+r/p9j4g7wmtAZYWcDJnP3+uEugAIgP8+vr5zmGYLAgWdzvzFKGMqow9pz4lI
         XbLNEPRYxD68MBMv1ro7IwtC5GYa1VGwvOFgnm51LpG31k7AJdc7yJyGeBCyL9VZj21r
         BZMLM1jZM2r1c1Gfs3c/ccu+xPKiJK0HWsf9R2Wg2ffPodjV4xlqhQoGu4r7l/UOnLwY
         r3f6vf+e8y9rhh7vdbveUMcmincYVNq1PaoKLbS8YopCyCeqxYIWsN2+cfl9Nf7kW09g
         XmevVWxyUjcQLOML9RTdZ0PvVUGVakBCc94pNc/4/w01WtJPjhw0O+Otqu2RrJMDU2lL
         NAVQ==
X-Gm-Message-State: AOJu0YzLIXhQlD1razNi/cZ8La0fNoVHzk0X9EC70zZqwMMGOesweYuW
	iY+2iwQDRl1PIePID2H0+D34I91x763Gt2TBoI6y5vgdMzB4FAX+mYoMQM2n
X-Google-Smtp-Source: AGHT+IE1CXaOCBBwmnIsrXW+CxVGID18tBfVByYOQxx6GJVHZ8C0dSozrXTncVo+8eQy8eUm0EfhBw==
X-Received: by 2002:a05:620a:1911:b0:79f:37f:9c3e with SMTP id af79cd13be357-7a34efdcdf5mr48455885a.68.1722528301015;
        Thu, 01 Aug 2024 09:05:01 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f772a35sm2100085a.75.2024.08.01.09.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:05:00 -0700 (PDT)
Date: Thu, 1 Aug 2024 16:04:58 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: archana.polampalli@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/1] buildah: fix
 CVE-2024-3727
Message-ID: <ZquyKvg3802tjSHt@gmail.com>
References: <20240731103008.1221210-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731103008.1221210-1-archana.polampalli@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 16:05:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8854

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/1] buildah: fix CVE-2024-3727
on 31/07/2024 Polampalli, Archana via lists.yoctoproject.org wrote:

> From: Archana Polampalli <archana.polampalli@windriver.com>
> 
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../buildah/buildah/CVE-2024-3727-0001.patch  |  54 ++
>  .../buildah/buildah/CVE-2024-3727-0002.patch  | 573 ++++++++++++++++++
>  .../buildah/buildah/CVE-2024-3727-0003.patch  |  96 +++
>  .../buildah/buildah/CVE-2024-3727-0004.patch  |  84 +++
>  .../buildah/buildah/CVE-2024-3727-0005.patch  | 417 +++++++++++++
>  .../buildah/buildah/CVE-2024-3727-0006.patch  |  37 ++
>  recipes-containers/buildah/buildah_git.bb     |   6 +
>  7 files changed, 1267 insertions(+)
>  create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0001.patch
>  create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0002.patch
>  create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0003.patch
>  create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0004.patch
>  create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0005.patch
>  create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0006.patch
> 
> diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0001.patch b/recipes-containers/buildah/buildah/CVE-2024-3727-0001.patch
> new file mode 100644
> index 00000000..20fa091e
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0001.patch
> @@ -0,0 +1,54 @@
> +From 9c49ca12d641c8d75a0b70ee3f1989b81d760634 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Miloslav=20Trma=C4=8D?= <mitr@redhat.com>
> +Date: Wed, 17 Jan 2024 23:29:52 +0100
> +Subject: [PATCH] Validate digests before using them
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +If doing it makes sense at all, it should happen before
> +the values are used.
> +
> +Signed-off-by: Miloslav Trmač <mitr@redhat.com>
> +CVE: CVE-2024-3727
> +Upstream-Status: Backport [https://github.com/containers/image/commit/9c49ca12d641c8d75a0b70ee3f1989b81d760634]
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + storage/storage_dest.go | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/storage/storage_dest.go b/storage/storage_dest.go
> +index 07e1d5e1..2a668aa5 100644
> +--- a/storage/storage_dest.go
> ++++ b/storage/storage_dest.go
> +@@ -324,6 +324,13 @@ func (s *storageImageDestination) TryReusingBlobWithOptions(ctx context.Context,
> + // tryReusingBlobAsPending implements TryReusingBlobWithOptions for (digest, size or -1), filling s.blobDiffIDs and other metadata.
> + // The caller must arrange the blob to be eventually committed using s.commitLayer().
> + func (s *storageImageDestination) tryReusingBlobAsPending(digest digest.Digest, size int64, options *private.TryReusingBlobOptions) (bool, private.ReusedBlob, error) {
> ++	if digest == "" {
> ++		return false, private.ReusedBlob{}, errors.New(`Can not check for a blob with unknown digest`)
> ++	}
> ++	if err := digest.Validate(); err != nil {
> ++		return false, private.ReusedBlob{}, fmt.Errorf("Can not check for a blob with invalid digest: %w", err)
> ++	}
> ++
> + 	// lock the entire method as it executes fairly quickly
> + 	s.lock.Lock()
> + 	defer s.lock.Unlock()
> +@@ -344,13 +351,6 @@ func (s *storageImageDestination) tryReusingBlobAsPending(digest digest.Digest,
> + 		}
> + 	}
> + 
> +-	if digest == "" {
> +-		return false, private.ReusedBlob{}, errors.New(`Can not check for a blob with unknown digest`)
> +-	}
> +-	if err := digest.Validate(); err != nil {
> +-		return false, private.ReusedBlob{}, fmt.Errorf("Can not check for a blob with invalid digest: %w", err)
> +-	}
> +-
> + 	// Check if we've already cached it in a file.
> + 	if size, ok := s.fileSizes[digest]; ok {
> + 		return true, private.ReusedBlob{
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0002.patch b/recipes-containers/buildah/buildah/CVE-2024-3727-0002.patch
> new file mode 100644
> index 00000000..774f145f
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0002.patch
> @@ -0,0 +1,573 @@
> +From af94ba17ceb184256966edd7d71b10aad2972156 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Miloslav=20Trma=C4=8D?= <mitr@redhat.com>
> +Date: Wed, 17 Apr 2024 22:26:46 +0200
> +Subject: [PATCH] Call .Validate() before digest.Hex() / digest.Encoded()
> + MIME-Version: 1.0 Content-Type: text/plain; charset=UTF-8
> + Content-Transfer-Encoding: 8bit
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +... to prevent panics if the value does not contain a :, or other unexpected
> +values (e.g. a path traversal).
> +
> +Don't bother on paths where we computed the digest ourselves, or it is already trusted
> +for other reasons.
> +
> +Signed-off-by: Miloslav Trmač <mitr@redhat.com>
> +CVE: CVE-2024-3727
> +Upstream-Status: Backport [https://github.com/containers/image/commit/af94ba17ceb184256966edd7d71b10aad2972156]
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + .../containers/image/v5/copy/progress_bars.go |  7 +++-
> + .../containers/image/v5/copy/single.go        | 39 ++++++++++++++-----
> + .../image/v5/directory/directory_dest.go      | 22 +++++++++--
> + .../image/v5/directory/directory_src.go       | 17 ++++++--
> + .../image/v5/directory/directory_transport.go | 25 ++++++++----
> + .../image/v5/docker/docker_image_dest.go      | 11 ++++--
> + .../image/v5/docker/docker_image_src.go       | 10 ++++-
> + .../image/v5/docker/internal/tarfile/dest.go  | 12 +++++-
> + .../v5/docker/internal/tarfile/writer.go      | 31 +++++++++++----
> + .../image/v5/docker/registries_d.go           |  7 +++-
> + .../containers/image/v5/ostree/ostree_dest.go | 10 +++++
> + .../containers/image/v5/ostree/ostree_src.go  |  4 +-
> + .../image/v5/storage/storage_dest.go          |  6 ++-
> + .../image/v5/storage/storage_image.go         |  7 +++-
> + .../image/v5/storage/storage_src.go           |  9 ++++-
> + 15 files changed, 169 insertions(+), 48 deletions(-)
> +
> +diff --git a/vendor/github.com/containers/image/v5/copy/progress_bars.go b/vendor/github.com/containers/image/v5/copy/progress_bars.go
> +index ce078234c..ba6a27389 100644
> +--- a/vendor/github.com/containers/image/v5/copy/progress_bars.go
> ++++ b/vendor/github.com/containers/image/v5/copy/progress_bars.go
> +@@ -48,10 +48,13 @@ type progressBar struct {
> + // As a convention, most users of progress bars should call mark100PercentComplete on full success;
> + // by convention, we don't leave progress bars in partial state when fully done
> + // (even if we copied much less data than anticipated).
> +-func (c *copier) createProgressBar(pool *mpb.Progress, partial bool, info types.BlobInfo, kind string, onComplete string) *progressBar {
> ++func (c *copier) createProgressBar(pool *mpb.Progress, partial bool, info types.BlobInfo, kind string, onComplete string) (*progressBar, error) {
> + 	// shortDigestLen is the length of the digest used for blobs.
> + 	const shortDigestLen = 12
> + 
> ++	if err := info.Digest.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, so validate explicitly.
> ++		return nil, err
> ++	}
> + 	prefix := fmt.Sprintf("Copying %s %s", kind, info.Digest.Encoded())
> + 	// Truncate the prefix (chopping of some part of the digest) to make all progress bars aligned in a column.
> + 	maxPrefixLen := len("Copying blob ") + shortDigestLen
> +@@ -104,7 +107,7 @@ func (c *copier) createProgressBar(pool *mpb.Progress, partial bool, info types.
> + 	return &progressBar{
> + 		Bar:          bar,
> + 		originalSize: info.Size,
> +-	}
> ++	}, nil
> + }
> + 
> + // printCopyInfo prints a "Copying ..." message on the copier if the output is
> +diff --git a/vendor/github.com/containers/image/v5/copy/single.go b/vendor/github.com/containers/image/v5/copy/single.go
> +index 67ca43f7b..d36b8542d 100644
> +--- a/vendor/github.com/containers/image/v5/copy/single.go
> ++++ b/vendor/github.com/containers/image/v5/copy/single.go
> +@@ -599,7 +599,10 @@ func (ic *imageCopier) copyConfig(ctx context.Context, src types.Image) error {
> + 		destInfo, err := func() (types.BlobInfo, error) { // A scope for defer
> + 			progressPool := ic.c.newProgressPool()
> + 			defer progressPool.Wait()
> +-			bar := ic.c.createProgressBar(progressPool, false, srcInfo, "config", "done")
> ++			bar, err := ic.c.createProgressBar(progressPool, false, srcInfo, "config", "done")
> ++			if err != nil {
> ++				return types.BlobInfo{}, err
> ++			}
> + 			defer bar.Abort(false)
> + 			ic.c.printCopyInfo("config", srcInfo)
> + 
> +@@ -707,11 +710,17 @@ func (ic *imageCopier) copyLayer(ctx context.Context, srcInfo types.BlobInfo, to
> + 		}
> + 		if reused {
> + 			logrus.Debugf("Skipping blob %s (already present):", srcInfo.Digest)
> +-			func() { // A scope for defer
> +-				bar := ic.c.createProgressBar(pool, false, types.BlobInfo{Digest: reusedBlob.Digest, Size: 0}, "blob", "skipped: already exists")
> ++			if err := func() error { // A scope for defer
> ++				bar, err := ic.c.createProgressBar(pool, false, types.BlobInfo{Digest: reusedBlob.Digest, Size: 0}, "blob", "skipped: already exists")
> ++				if err != nil {
> ++					return err
> ++				}
> + 				defer bar.Abort(false)
> + 				bar.mark100PercentComplete()
> +-			}()
> ++				return nil
> ++			}(); err != nil {
> ++				return types.BlobInfo{}, "", err
> ++			}
> + 
> + 			// Throw an event that the layer has been skipped
> + 			if ic.c.options.Progress != nil && ic.c.options.ProgressInterval > 0 {
> +@@ -730,8 +739,11 @@ func (ic *imageCopier) copyLayer(ctx context.Context, srcInfo types.BlobInfo, to
> + 	// Attempt a partial only when the source allows to retrieve a blob partially and
> + 	// the destination has support for it.
> + 	if canAvoidProcessingCompleteLayer && ic.c.rawSource.SupportsGetBlobAt() && ic.c.dest.SupportsPutBlobPartial() {
> +-		if reused, blobInfo := func() (bool, types.BlobInfo) { // A scope for defer
> +-			bar := ic.c.createProgressBar(pool, true, srcInfo, "blob", "done")
> ++		reused, blobInfo, err := func() (bool, types.BlobInfo, error) { // A scope for defer
> ++			bar, err := ic.c.createProgressBar(pool, true, srcInfo, "blob", "done")
> ++			if err != nil {
> ++				return false, types.BlobInfo{}, err
> ++			}
> + 			hideProgressBar := true
> + 			defer func() { // Note that this is not the same as defer bar.Abort(hideProgressBar); we need hideProgressBar to be evaluated lazily.
> + 				bar.Abort(hideProgressBar)
> +@@ -751,18 +763,25 @@ func (ic *imageCopier) copyLayer(ctx context.Context, srcInfo types.BlobInfo, to
> + 				bar.mark100PercentComplete()
> + 				hideProgressBar = false
> + 				logrus.Debugf("Retrieved partial blob %v", srcInfo.Digest)
> +-				return true, updatedBlobInfoFromUpload(srcInfo, uploadedBlob)
> ++				return true, updatedBlobInfoFromUpload(srcInfo, uploadedBlob), nil
> + 			}
> + 			logrus.Debugf("Failed to retrieve partial blob: %v", err)
> +-			return false, types.BlobInfo{}
> +-		}(); reused {
> ++			return false, types.BlobInfo{}, nil
> ++		}()
> ++		if err != nil {
> ++			return types.BlobInfo{}, "", err
> ++		}
> ++		if reused {
> + 			return blobInfo, cachedDiffID, nil
> + 		}
> + 	}
> + 
> + 	// Fallback: copy the layer, computing the diffID if we need to do so
> + 	return func() (types.BlobInfo, digest.Digest, error) { // A scope for defer
> +-		bar := ic.c.createProgressBar(pool, false, srcInfo, "blob", "done")
> ++		bar, err := ic.c.createProgressBar(pool, false, srcInfo, "blob", "done")
> ++		if err != nil {
> ++			return types.BlobInfo{}, "", err
> ++		}
> + 		defer bar.Abort(false)
> + 
> + 		srcStream, srcBlobSize, err := ic.c.rawSource.GetBlob(ctx, srcInfo, ic.c.blobInfoCache)
> +diff --git a/vendor/github.com/containers/image/v5/directory/directory_dest.go b/vendor/github.com/containers/image/v5/directory/directory_dest.go
> +index 222723a8f..d32877e0c 100644
> +--- a/vendor/github.com/containers/image/v5/directory/directory_dest.go
> ++++ b/vendor/github.com/containers/image/v5/directory/directory_dest.go
> +@@ -173,7 +173,10 @@ func (d *dirImageDestination) PutBlobWithOptions(ctx context.Context, stream io.
> + 		}
> + 	}
> + 
> +-	blobPath := d.ref.layerPath(blobDigest)
> ++	blobPath, err := d.ref.layerPath(blobDigest)
> ++	if err != nil {
> ++		return private.UploadedBlob{}, err
> ++	}
> + 	// need to explicitly close the file, since a rename won't otherwise not work on Windows
> + 	blobFile.Close()
> + 	explicitClosed = true
> +@@ -196,7 +199,10 @@ func (d *dirImageDestination) TryReusingBlobWithOptions(ctx context.Context, inf
> + 	if info.Digest == "" {
> + 		return false, private.ReusedBlob{}, fmt.Errorf("Can not check for a blob with unknown digest")
> + 	}
> +-	blobPath := d.ref.layerPath(info.Digest)
> ++	blobPath, err := d.ref.layerPath(info.Digest)
> ++	if err != nil {
> ++		return false, private.ReusedBlob{}, err
> ++	}
> + 	finfo, err := os.Stat(blobPath)
> + 	if err != nil && os.IsNotExist(err) {
> + 		return false, private.ReusedBlob{}, nil
> +@@ -216,7 +222,11 @@ func (d *dirImageDestination) TryReusingBlobWithOptions(ctx context.Context, inf
> + // If the destination is in principle available, refuses this manifest type (e.g. it does not recognize the schema),
> + // but may accept a different manifest type, the returned error must be an ManifestTypeRejectedError.
> + func (d *dirImageDestination) PutManifest(ctx context.Context, manifest []byte, instanceDigest *digest.Digest) error {
> +-	return os.WriteFile(d.ref.manifestPath(instanceDigest), manifest, 0644)
> ++	path, err := d.ref.manifestPath(instanceDigest)
> ++	if err != nil {
> ++		return err
> ++	}
> ++	return os.WriteFile(path, manifest, 0644)
> + }
> + 
> + // PutSignaturesWithFormat writes a set of signatures to the destination.
> +@@ -229,7 +239,11 @@ func (d *dirImageDestination) PutSignaturesWithFormat(ctx context.Context, signa
> + 		if err != nil {
> + 			return err
> + 		}
> +-		if err := os.WriteFile(d.ref.signaturePath(i, instanceDigest), blob, 0644); err != nil {
> ++		path, err := d.ref.signaturePath(i, instanceDigest)
> ++		if err != nil {
> ++			return err
> ++		}
> ++		if err := os.WriteFile(path, blob, 0644); err != nil {
> + 			return err
> + 		}
> + 	}
> +diff --git a/vendor/github.com/containers/image/v5/directory/directory_src.go b/vendor/github.com/containers/image/v5/directory/directory_src.go
> +index 5fc83bb6f..6d725bcfa 100644
> +--- a/vendor/github.com/containers/image/v5/directory/directory_src.go
> ++++ b/vendor/github.com/containers/image/v5/directory/directory_src.go
> +@@ -55,7 +55,11 @@ func (s *dirImageSource) Close() error {
> + // If instanceDigest is not nil, it contains a digest of the specific manifest instance to retrieve (when the primary manifest is a manifest list);
> + // this never happens if the primary manifest is not a manifest list (e.g. if the source never returns manifest lists).
> + func (s *dirImageSource) GetManifest(ctx context.Context, instanceDigest *digest.Digest) ([]byte, string, error) {
> +-	m, err := os.ReadFile(s.ref.manifestPath(instanceDigest))
> ++	path, err := s.ref.manifestPath(instanceDigest)
> ++	if err != nil {
> ++		return nil, "", err
> ++	}
> ++	m, err := os.ReadFile(path)
> + 	if err != nil {
> + 		return nil, "", err
> + 	}
> +@@ -66,7 +70,11 @@ func (s *dirImageSource) GetManifest(ctx context.Context, instanceDigest *digest
> + // The Digest field in BlobInfo is guaranteed to be provided, Size may be -1 and MediaType may be optionally provided.
> + // May update BlobInfoCache, preferably after it knows for certain that a blob truly exists at a specific location.
> + func (s *dirImageSource) GetBlob(ctx context.Context, info types.BlobInfo, cache types.BlobInfoCache) (io.ReadCloser, int64, error) {
> +-	r, err := os.Open(s.ref.layerPath(info.Digest))
> ++	path, err := s.ref.layerPath(info.Digest)
> ++	if err != nil {
> ++		return nil, -1, err
> ++	}
> ++	r, err := os.Open(path)
> + 	if err != nil {
> + 		return nil, -1, err
> + 	}
> +@@ -84,7 +92,10 @@ func (s *dirImageSource) GetBlob(ctx context.Context, info types.BlobInfo, cache
> + func (s *dirImageSource) GetSignaturesWithFormat(ctx context.Context, instanceDigest *digest.Digest) ([]signature.Signature, error) {
> + 	signatures := []signature.Signature{}
> + 	for i := 0; ; i++ {
> +-		path := s.ref.signaturePath(i, instanceDigest)
> ++		path, err := s.ref.signaturePath(i, instanceDigest)
> ++		if err != nil {
> ++			return nil, err
> ++		}
> + 		sigBlob, err := os.ReadFile(path)
> + 		if err != nil {
> + 			if os.IsNotExist(err) {
> +diff --git a/vendor/github.com/containers/image/v5/directory/directory_transport.go b/vendor/github.com/containers/image/v5/directory/directory_transport.go
> +index 7e3068693..4f7d596b4 100644
> +--- a/vendor/github.com/containers/image/v5/directory/directory_transport.go
> ++++ b/vendor/github.com/containers/image/v5/directory/directory_transport.go
> +@@ -161,25 +161,34 @@ func (ref dirReference) DeleteImage(ctx context.Context, sys *types.SystemContex
> + }
> + 
> + // manifestPath returns a path for the manifest within a directory using our conventions.
> +-func (ref dirReference) manifestPath(instanceDigest *digest.Digest) string {
> ++func (ref dirReference) manifestPath(instanceDigest *digest.Digest) (string, error) {
> + 	if instanceDigest != nil {
> +-		return filepath.Join(ref.path, instanceDigest.Encoded()+".manifest.json")
> ++		if err := instanceDigest.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, and could possibly result in a path with ../, so validate explicitly.
> ++			return "", err
> ++		}
> ++		return filepath.Join(ref.path, instanceDigest.Encoded()+".manifest.json"), nil
> + 	}
> +-	return filepath.Join(ref.path, "manifest.json")
> ++	return filepath.Join(ref.path, "manifest.json"), nil
> + }
> + 
> + // layerPath returns a path for a layer tarball within a directory using our conventions.
> +-func (ref dirReference) layerPath(digest digest.Digest) string {
> ++func (ref dirReference) layerPath(digest digest.Digest) (string, error) {
> ++	if err := digest.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, and could possibly result in a path with ../, so validate explicitly.
> ++		return "", err
> ++	}
> + 	// FIXME: Should we keep the digest identification?
> +-	return filepath.Join(ref.path, digest.Encoded())
> ++	return filepath.Join(ref.path, digest.Encoded()), nil
> + }
> + 
> + // signaturePath returns a path for a signature within a directory using our conventions.
> +-func (ref dirReference) signaturePath(index int, instanceDigest *digest.Digest) string {
> ++func (ref dirReference) signaturePath(index int, instanceDigest *digest.Digest) (string, error) {
> + 	if instanceDigest != nil {
> +-		return filepath.Join(ref.path, fmt.Sprintf(instanceDigest.Encoded()+".signature-%d", index+1))
> ++		if err := instanceDigest.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, and could possibly result in a path with ../, so validate explicitly.
> ++			return "", err
> ++		}
> ++		return filepath.Join(ref.path, fmt.Sprintf(instanceDigest.Encoded()+".signature-%d", index+1)), nil
> + 	}
> +-	return filepath.Join(ref.path, fmt.Sprintf("signature-%d", index+1))
> ++	return filepath.Join(ref.path, fmt.Sprintf("signature-%d", index+1)), nil
> + }
> + 
> + // versionPath returns a path for the version file within a directory using our conventions.
> +diff --git a/vendor/github.com/containers/image/v5/docker/docker_image_dest.go b/vendor/github.com/containers/image/v5/docker/docker_image_dest.go
> +index 774068c27..0e07fd558 100644
> +--- a/vendor/github.com/containers/image/v5/docker/docker_image_dest.go
> ++++ b/vendor/github.com/containers/image/v5/docker/docker_image_dest.go
> +@@ -624,11 +624,13 @@ func (d *dockerImageDestination) putSignaturesToLookaside(signatures []signature
> + 
> + 	// NOTE: Keep this in sync with docs/signature-protocols.md!
> + 	for i, signature := range signatures {
> +-		sigURL := lookasideStorageURL(d.c.signatureBase, manifestDigest, i)
> +-		err := d.putOneSignature(sigURL, signature)
> ++		sigURL, err := lookasideStorageURL(d.c.signatureBase, manifestDigest, i)
> + 		if err != nil {
> + 			return err
> + 		}
> ++		if err := d.putOneSignature(sigURL, signature); err != nil {
> ++			return err
> ++		}
> + 	}
> + 	// Remove any other signatures, if present.
> + 	// We stop at the first missing signature; if a previous deleting loop aborted
> +@@ -636,7 +638,10 @@ func (d *dockerImageDestination) putSignaturesToLookaside(signatures []signature
> + 	// is enough for dockerImageSource to stop looking for other signatures, so that
> + 	// is sufficient.
> + 	for i := len(signatures); ; i++ {
> +-		sigURL := lookasideStorageURL(d.c.signatureBase, manifestDigest, i)
> ++		sigURL, err := lookasideStorageURL(d.c.signatureBase, manifestDigest, i)
> ++		if err != nil {
> ++			return err
> ++		}
> + 		missing, err := d.c.deleteOneSignature(sigURL)
> + 		if err != nil {
> + 			return err
> +diff --git a/vendor/github.com/containers/image/v5/docker/docker_image_src.go b/vendor/github.com/containers/image/v5/docker/docker_image_src.go
> +index 231d5d212..4a5348774 100644
> +--- a/vendor/github.com/containers/image/v5/docker/docker_image_src.go
> ++++ b/vendor/github.com/containers/image/v5/docker/docker_image_src.go
> +@@ -457,7 +457,10 @@ func (s *dockerImageSource) getSignaturesFromLookaside(ctx context.Context, inst
> + 			return nil, fmt.Errorf("server provided %d signatures, assuming that's unreasonable and a server error", maxLookasideSignatures)
> + 		}
> + 
> +-		sigURL := lookasideStorageURL(s.c.signatureBase, manifestDigest, i)
> ++		sigURL, err := lookasideStorageURL(s.c.signatureBase, manifestDigest, i)
> ++		if err != nil {
> ++			return nil, err
> ++		}
> + 		signature, missing, err := s.getOneSignature(ctx, sigURL)
> + 		if err != nil {
> + 			return nil, err
> +@@ -651,7 +654,10 @@ func deleteImage(ctx context.Context, sys *types.SystemContext, ref dockerRefere
> + 	}
> + 
> + 	for i := 0; ; i++ {
> +-		sigURL := lookasideStorageURL(c.signatureBase, manifestDigest, i)
> ++		sigURL, err := lookasideStorageURL(c.signatureBase, manifestDigest, i)
> ++		if err != nil {
> ++			return err
> ++		}
> + 		missing, err := c.deleteOneSignature(sigURL)
> + 		if err != nil {
> + 			return err
> +diff --git a/vendor/github.com/containers/image/v5/docker/internal/tarfile/dest.go b/vendor/github.com/containers/image/v5/docker/internal/tarfile/dest.go
> +index 7507d8559..106490cb3 100644
> +--- a/vendor/github.com/containers/image/v5/docker/internal/tarfile/dest.go
> ++++ b/vendor/github.com/containers/image/v5/docker/internal/tarfile/dest.go
> +@@ -111,11 +111,19 @@ func (d *Destination) PutBlobWithOptions(ctx context.Context, stream io.Reader,
> + 			return private.UploadedBlob{}, fmt.Errorf("reading Config file stream: %w", err)
> + 		}
> + 		d.config = buf
> +-		if err := d.archive.sendFileLocked(d.archive.configPath(inputInfo.Digest), inputInfo.Size, bytes.NewReader(buf)); err != nil {
> ++		configPath, err := d.archive.configPath(inputInfo.Digest)
> ++		if err != nil {
> ++			return private.UploadedBlob{}, err
> ++		}
> ++		if err := d.archive.sendFileLocked(configPath, inputInfo.Size, bytes.NewReader(buf)); err != nil {
> + 			return private.UploadedBlob{}, fmt.Errorf("writing Config file: %w", err)
> + 		}
> + 	} else {
> +-		if err := d.archive.sendFileLocked(d.archive.physicalLayerPath(inputInfo.Digest), inputInfo.Size, stream); err != nil {
> ++		layerPath, err := d.archive.physicalLayerPath(inputInfo.Digest)
> ++		if err != nil {
> ++			return private.UploadedBlob{}, err
> ++		}
> ++		if err := d.archive.sendFileLocked(layerPath, inputInfo.Size, stream); err != nil {
> + 			return private.UploadedBlob{}, err
> + 		}
> + 	}
> +diff --git a/vendor/github.com/containers/image/v5/docker/internal/tarfile/writer.go b/vendor/github.com/containers/image/v5/docker/internal/tarfile/writer.go
> +index df7b2c090..2d83254d7 100644
> +--- a/vendor/github.com/containers/image/v5/docker/internal/tarfile/writer.go
> ++++ b/vendor/github.com/containers/image/v5/docker/internal/tarfile/writer.go
> +@@ -95,7 +95,10 @@ func (w *Writer) ensureSingleLegacyLayerLocked(layerID string, layerDigest diges
> + 	if !w.legacyLayers.Contains(layerID) {
> + 		// Create a symlink for the legacy format, where there is one subdirectory per layer ("image").
> + 		// See also the comment in physicalLayerPath.
> +-		physicalLayerPath := w.physicalLayerPath(layerDigest)
> ++		physicalLayerPath, err := w.physicalLayerPath(layerDigest)
> ++		if err != nil {
> ++			return err
> ++		}
> + 		if err := w.sendSymlinkLocked(filepath.Join(layerID, legacyLayerFileName), filepath.Join("..", physicalLayerPath)); err != nil {
> + 			return fmt.Errorf("creating layer symbolic link: %w", err)
> + 		}
> +@@ -204,12 +207,20 @@ func checkManifestItemsMatch(a, b *ManifestItem) error {
> + func (w *Writer) ensureManifestItemLocked(layerDescriptors []manifest.Schema2Descriptor, configDigest digest.Digest, repoTags []reference.NamedTagged) error {
> + 	layerPaths := []string{}
> + 	for _, l := range layerDescriptors {
> +-		layerPaths = append(layerPaths, w.physicalLayerPath(l.Digest))
> ++		p, err := w.physicalLayerPath(l.Digest)
> ++		if err != nil {
> ++			return err
> ++		}
> ++		layerPaths = append(layerPaths, p)
> + 	}
> + 
> + 	var item *ManifestItem
> ++	configPath, err := w.configPath(configDigest)
> ++	if err != nil {
> ++		return err
> ++	}
> + 	newItem := ManifestItem{
> +-		Config:       w.configPath(configDigest),
> ++		Config:       configPath,
> + 		RepoTags:     []string{},
> + 		Layers:       layerPaths,
> + 		Parent:       "", // We don’t have this information
> +@@ -294,21 +305,27 @@ func (w *Writer) Close() error {
> + // configPath returns a path we choose for storing a config with the specified digest.
> + // NOTE: This is an internal implementation detail, not a format property, and can change
> + // any time.
> +-func (w *Writer) configPath(configDigest digest.Digest) string {
> +-	return configDigest.Hex() + ".json"
> ++func (w *Writer) configPath(configDigest digest.Digest) (string, error) {
> ++	if err := configDigest.Validate(); err != nil { // digest.Digest.Hex() panics on failure, and could possibly result in unexpected paths, so validate explicitly.
> ++		return "", err
> ++	}
> ++	return configDigest.Hex() + ".json", nil
> + }
> + 
> + // physicalLayerPath returns a path we choose for storing a layer with the specified digest
> + // (the actual path, i.e. a regular file, not a symlink that may be used in the legacy format).
> + // NOTE: This is an internal implementation detail, not a format property, and can change
> + // any time.
> +-func (w *Writer) physicalLayerPath(layerDigest digest.Digest) string {
> ++func (w *Writer) physicalLayerPath(layerDigest digest.Digest) (string, error) {
> ++	if err := layerDigest.Validate(); err != nil { // digest.Digest.Hex() panics on failure, and could possibly result in unexpected paths, so validate explicitly.
> ++		return "", err
> ++	}
> + 	// Note that this can't be e.g. filepath.Join(l.Digest.Hex(), legacyLayerFileName); due to the way
> + 	// writeLegacyMetadata constructs layer IDs differently from inputinfo.Digest values (as described
> + 	// inside it), most of the layers would end up in subdirectories alone without any metadata; (docker load)
> + 	// tries to load every subdirectory as an image and fails if the config is missing.  So, keep the layers
> + 	// in the root of the tarball.
> +-	return layerDigest.Hex() + ".tar"
> ++	return layerDigest.Hex() + ".tar", nil
> + }
> + 
> + type tarFI struct {
> +diff --git a/vendor/github.com/containers/image/v5/docker/registries_d.go b/vendor/github.com/containers/image/v5/docker/registries_d.go
> +index c7b884ab3..9d651d9bd 100644
> +--- a/vendor/github.com/containers/image/v5/docker/registries_d.go
> ++++ b/vendor/github.com/containers/image/v5/docker/registries_d.go
> +@@ -286,8 +286,11 @@ func (ns registryNamespace) signatureTopLevel(write bool) string {
> + // lookasideStorageURL returns an URL usable for accessing signature index in base with known manifestDigest.
> + // base is not nil from the caller
> + // NOTE: Keep this in sync with docs/signature-protocols.md!
> +-func lookasideStorageURL(base lookasideStorageBase, manifestDigest digest.Digest, index int) *url.URL {
> ++func lookasideStorageURL(base lookasideStorageBase, manifestDigest digest.Digest, index int) (*url.URL, error) {
> ++	if err := manifestDigest.Validate(); err != nil { // digest.Digest.Hex() panics on failure, and could possibly result in a path with ../, so validate explicitly.
> ++		return nil, err
> ++	}
> + 	sigURL := *base
> + 	sigURL.Path = fmt.Sprintf("%s@%s=%s/signature-%d", sigURL.Path, manifestDigest.Algorithm(), manifestDigest.Hex(), index+1)
> +-	return &sigURL
> ++	return &sigURL, nil
> + }
> +diff --git a/vendor/github.com/containers/image/v5/ostree/ostree_dest.go b/vendor/github.com/containers/image/v5/ostree/ostree_dest.go
> +index d00a0cdf8..29177f11a 100644
> +--- a/vendor/github.com/containers/image/v5/ostree/ostree_dest.go
> ++++ b/vendor/github.com/containers/image/v5/ostree/ostree_dest.go
> +@@ -345,6 +345,10 @@ func (d *ostreeImageDestination) TryReusingBlobWithOptions(ctx context.Context,
> + 		}
> + 		d.repo = repo
> + 	}
> ++
> ++	if err := info.Digest.Validate(); err != nil { // digest.Digest.Hex() panics on failure, so validate explicitly.
> ++		return false, private.ReusedBlob{}, err
> ++	}
> + 	branch := fmt.Sprintf("ociimage/%s", info.Digest.Hex())
> + 
> + 	found, data, err := readMetadata(d.repo, branch, "docker.uncompressed_digest")
> +@@ -470,12 +474,18 @@ func (d *ostreeImageDestination) Commit(context.Context, types.UnparsedImage) er
> + 		return nil
> + 	}
> + 	for _, layer := range d.schema.LayersDescriptors {
> ++		if err := layer.Digest.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, so validate explicitly.
> ++			return err
> ++		}
> + 		hash := layer.Digest.Hex()
> + 		if err = checkLayer(hash); err != nil {
> + 			return err
> + 		}
> + 	}
> + 	for _, layer := range d.schema.FSLayers {
> ++		if err := layer.BlobSum.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, so validate explicitly.
> ++			return err
> ++		}
> + 		hash := layer.BlobSum.Hex()
> + 		if err = checkLayer(hash); err != nil {
> + 			return err
> +diff --git a/vendor/github.com/containers/image/v5/ostree/ostree_src.go b/vendor/github.com/containers/image/v5/ostree/ostree_src.go
> +index 9983acc0a..a9568c2d3 100644
> +--- a/vendor/github.com/containers/image/v5/ostree/ostree_src.go
> ++++ b/vendor/github.com/containers/image/v5/ostree/ostree_src.go
> +@@ -286,7 +286,9 @@ func (s *ostreeImageSource) readSingleFile(commit, path string) (io.ReadCloser,
> + // The Digest field in BlobInfo is guaranteed to be provided, Size may be -1 and MediaType may be optionally provided.
> + // May update BlobInfoCache, preferably after it knows for certain that a blob truly exists at a specific location.
> + func (s *ostreeImageSource) GetBlob(ctx context.Context, info types.BlobInfo, cache types.BlobInfoCache) (io.ReadCloser, int64, error) {
> +-
> ++	if err := info.Digest.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, so validate explicitly.
> ++		return nil, -1, err
> ++	}
> + 	blob := info.Digest.Hex()
> + 
> + 	// Ensure s.compressed is initialized.  It is build by LayerInfosForCopy.
> +diff --git a/vendor/github.com/containers/image/v5/storage/storage_dest.go b/vendor/github.com/containers/image/v5/storage/storage_dest.go
> +index 07e1d5e1f..0a5c36fb7 100644
> +--- a/vendor/github.com/containers/image/v5/storage/storage_dest.go
> ++++ b/vendor/github.com/containers/image/v5/storage/storage_dest.go
> +@@ -831,8 +831,12 @@ func (s *storageImageDestination) Commit(ctx context.Context, unparsedToplevel t
> + 		})
> + 	}
> + 	for instanceDigest, signatures := range s.signatureses {
> ++		key, err := signatureBigDataKey(instanceDigest)
> ++		if err != nil {
> ++			return err
> ++		}
> + 		options.BigData = append(options.BigData, storage.ImageBigDataOption{
> +-			Key:    signatureBigDataKey(instanceDigest),
> ++			Key:    key,
> + 			Data:   signatures,
> + 			Digest: digest.Canonical.FromBytes(signatures),
> + 		})
> +diff --git a/vendor/github.com/containers/image/v5/storage/storage_image.go b/vendor/github.com/containers/image/v5/storage/storage_image.go
> +index ac09f3dbb..b734c4129 100644
> +--- a/vendor/github.com/containers/image/v5/storage/storage_image.go
> ++++ b/vendor/github.com/containers/image/v5/storage/storage_image.go
> +@@ -32,8 +32,11 @@ func manifestBigDataKey(digest digest.Digest) string {
> + 
> + // signatureBigDataKey returns a key suitable for recording the signatures associated with the manifest with the specified digest using storage.Store.ImageBigData and related functions.
> + // If a specific manifest digest is explicitly requested by the user, the key returned by this function should be used preferably;
> +-func signatureBigDataKey(digest digest.Digest) string {
> +-	return "signature-" + digest.Encoded()
> ++func signatureBigDataKey(digest digest.Digest) (string, error) {
> ++	if err := digest.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, so validate explicitly.
> ++		return "", err
> ++	}
> ++	return "signature-" + digest.Encoded(), nil
> + }
> + 
> + // Size() returns the previously-computed size of the image, with no error.
> +diff --git a/vendor/github.com/containers/image/v5/storage/storage_src.go b/vendor/github.com/containers/image/v5/storage/storage_src.go
> +index f1ce0861e..29cce5635 100644
> +--- a/vendor/github.com/containers/image/v5/storage/storage_src.go
> ++++ b/vendor/github.com/containers/image/v5/storage/storage_src.go
> +@@ -329,7 +329,14 @@ func (s *storageImageSource) GetSignaturesWithFormat(ctx context.Context, instan
> + 	instance := "default instance"
> + 	if instanceDigest != nil {
> + 		signatureSizes = s.SignaturesSizes[*instanceDigest]
> +-		key = signatureBigDataKey(*instanceDigest)
> ++		k, err := signatureBigDataKey(*instanceDigest)
> ++		if err != nil {
> ++			return nil, err
> ++		}
> ++		key = k
> ++		if err := instanceDigest.Validate(); err != nil { // digest.Digest.Encoded() panics on failure, so validate explicitly.
> ++			return nil, err
> ++		}
> + 		instance = instanceDigest.Encoded()
> + 	}
> + 	if len(signatureSizes) > 0 {
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0003.patch b/recipes-containers/buildah/buildah/CVE-2024-3727-0003.patch
> new file mode 100644
> index 00000000..fd911c4a
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0003.patch
> @@ -0,0 +1,96 @@
> +From 7b58b430ec8e64876d9b9dbd81989666293ffe87 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Miloslav=20Trma=C4=8D?= <mitr@redhat.com>
> +Date: Thu, 18 Apr 2024 00:39:54 +0200
> +Subject: [PATCH] Refactor the error handling path of saveStream
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Use defer() to remove the temporary file, instead
> +of duplicating the call.
> +
> +Should not change behavior.
> +
> +Signed-off-by: Miloslav Trmač <mitr@redhat.com>
> +CVE: CVE-2024-3727
> +Upstream-Status: Backport [https://github.com/containers/image/commit/7b58b430ec8e64876d9b9dbd81989666293ffe87]
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +
> +---
> + pkg/blobcache/dest.go | 51 ++++++++++++++++++++++++-------------------
> + 1 file changed, 28 insertions(+), 23 deletions(-)
> +
> +diff --git a/pkg/blobcache/dest.go b/pkg/blobcache/dest.go
> +index 9bda0851..ac07cd3f 100644
> +--- a/pkg/blobcache/dest.go
> ++++ b/pkg/blobcache/dest.go
> +@@ -80,6 +80,17 @@ func (d *blobCacheDestination) IgnoresEmbeddedDockerReference() bool {
> + // and this new file.
> + func (d *blobCacheDestination) saveStream(wg *sync.WaitGroup, decompressReader io.ReadCloser, tempFile *os.File, compressedFilename string, compressedDigest digest.Digest, isConfig bool, alternateDigest *digest.Digest) {
> + 	defer wg.Done()
> ++
> ++	succeeded := false
> ++	defer func() {
> ++		if !succeeded {
> ++			// Remove the temporary file.
> ++			if err := os.Remove(tempFile.Name()); err != nil {
> ++				logrus.Debugf("error cleaning up temporary file %q for decompressed copy of blob %q: %v", tempFile.Name(), compressedDigest.String(), err)
> ++			}
> ++		}
> ++	}()
> ++
> + 	// Decompress from and digest the reading end of that pipe.
> + 	decompressed, err3 := archive.DecompressStream(decompressReader)
> + 	digester := digest.Canonical.Digester()
> +@@ -96,31 +107,25 @@ func (d *blobCacheDestination) saveStream(wg *sync.WaitGroup, decompressReader i
> + 	decompressReader.Close()
> + 	decompressed.Close()
> + 	tempFile.Close()
> ++
> + 	// Determine the name that we should give to the uncompressed copy of the blob.
> + 	decompressedFilename := d.reference.blobPath(digester.Digest(), isConfig)
> +-	if err3 == nil {
> +-		// Rename the temporary file.
> +-		if err3 = os.Rename(tempFile.Name(), decompressedFilename); err3 != nil {
> +-			logrus.Debugf("error renaming new decompressed copy of blob %q into place at %q: %v", digester.Digest().String(), decompressedFilename, err3)
> +-			// Remove the temporary file.
> +-			if err3 = os.Remove(tempFile.Name()); err3 != nil {
> +-				logrus.Debugf("error cleaning up temporary file %q for decompressed copy of blob %q: %v", tempFile.Name(), compressedDigest.String(), err3)
> +-			}
> +-		} else {
> +-			*alternateDigest = digester.Digest()
> +-			// Note the relationship between the two files.
> +-			if err3 = ioutils.AtomicWriteFile(decompressedFilename+compressedNote, []byte(compressedDigest.String()), 0600); err3 != nil {
> +-				logrus.Debugf("error noting that the compressed version of %q is %q: %v", digester.Digest().String(), compressedDigest.String(), err3)
> +-			}
> +-			if err3 = ioutils.AtomicWriteFile(compressedFilename+decompressedNote, []byte(digester.Digest().String()), 0600); err3 != nil {
> +-				logrus.Debugf("error noting that the decompressed version of %q is %q: %v", compressedDigest.String(), digester.Digest().String(), err3)
> +-			}
> +-		}
> +-	} else {
> +-		// Remove the temporary file.
> +-		if err3 = os.Remove(tempFile.Name()); err3 != nil {
> +-			logrus.Debugf("error cleaning up temporary file %q for decompressed copy of blob %q: %v", tempFile.Name(), compressedDigest.String(), err3)
> +-		}
> ++	if err3 != nil {
> ++		return
> ++	}
> ++	// Rename the temporary file.
> ++	if err := os.Rename(tempFile.Name(), decompressedFilename); err != nil {
> ++		logrus.Debugf("error renaming new decompressed copy of blob %q into place at %q: %v", digester.Digest().String(), decompressedFilename, err)
> ++		return
> ++	}
> ++	succeeded = true
> ++	*alternateDigest = digester.Digest()
> ++	// Note the relationship between the two files.
> ++	if err := ioutils.AtomicWriteFile(decompressedFilename+compressedNote, []byte(compressedDigest.String()), 0600); err != nil {
> ++		logrus.Debugf("error noting that the compressed version of %q is %q: %v", digester.Digest().String(), compressedDigest.String(), err)
> ++	}
> ++	if err := ioutils.AtomicWriteFile(compressedFilename+decompressedNote, []byte(digester.Digest().String()), 0600); err != nil {
> ++		logrus.Debugf("error noting that the decompressed version of %q is %q: %v", compressedDigest.String(), digester.Digest().String(), err)
> + 	}
> + }
> + 
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0004.patch b/recipes-containers/buildah/buildah/CVE-2024-3727-0004.patch
> new file mode 100644
> index 00000000..01b8a085
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0004.patch
> @@ -0,0 +1,84 @@
> +From 0860c58afa8561e31ab5bddbc75d193a7305622e Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Miloslav=20Trma=C4=8D?= <mitr@redhat.com>
> +Date: Thu, 18 Apr 2024 00:47:09 +0200
> +Subject: [PATCH] Refactor the error handling further
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Use defer, a nested function, and early returns.
> +
> +Besides being a bit more directly related to what
> +we want to achieve, this now does not call decompressed.Close()
> +on a nil value if DecompressStream fails.
> +
> +Signed-off-by: Miloslav Trmač <mitr@redhat.com>
> +CVE: CVE-2024-3727
> +Upstream-Status: Backport [https://github.com/containers/image/commit/0860c58afa8561e31ab5bddbc75d193a7305622e]
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +
> +---
> + pkg/blobcache/dest.go | 33 ++++++++++++++++++---------------
> + 1 file changed, 18 insertions(+), 15 deletions(-)
> +
> +diff --git a/pkg/blobcache/dest.go b/pkg/blobcache/dest.go
> +index ac07cd3f..fde95974 100644
> +--- a/pkg/blobcache/dest.go
> ++++ b/pkg/blobcache/dest.go
> +@@ -80,6 +80,7 @@ func (d *blobCacheDestination) IgnoresEmbeddedDockerReference() bool {
> + // and this new file.
> + func (d *blobCacheDestination) saveStream(wg *sync.WaitGroup, decompressReader io.ReadCloser, tempFile *os.File, compressedFilename string, compressedDigest digest.Digest, isConfig bool, alternateDigest *digest.Digest) {
> + 	defer wg.Done()
> ++	defer decompressReader.Close()
> + 
> + 	succeeded := false
> + 	defer func() {
> +@@ -91,28 +92,30 @@ func (d *blobCacheDestination) saveStream(wg *sync.WaitGroup, decompressReader i
> + 		}
> + 	}()
> + 
> +-	// Decompress from and digest the reading end of that pipe.
> +-	decompressed, err3 := archive.DecompressStream(decompressReader)
> + 	digester := digest.Canonical.Digester()
> +-	if err3 == nil {
> ++	if err := func() error { // A scope for defer
> ++		defer tempFile.Close()
> ++
> ++		// Decompress from and digest the reading end of that pipe.
> ++		decompressed, err := archive.DecompressStream(decompressReader)
> ++		if err != nil {
> ++			// Drain the pipe to keep from stalling the PutBlob() thread.
> ++			if _, err2 := io.Copy(io.Discard, decompressReader); err2 != nil {
> ++				logrus.Debugf("error draining the pipe: %v", err2)
> ++			}
> ++			return err
> ++		}
> ++		defer decompressed.Close()
> + 		// Read the decompressed data through the filter over the pipe, blocking until the
> + 		// writing end is closed.
> +-		_, err3 = io.Copy(io.MultiWriter(tempFile, digester.Hash()), decompressed)
> +-	} else {
> +-		// Drain the pipe to keep from stalling the PutBlob() thread.
> +-		if _, err := io.Copy(io.Discard, decompressReader); err != nil {
> +-			logrus.Debugf("error draining the pipe: %v", err)
> +-		}
> ++		_, err = io.Copy(io.MultiWriter(tempFile, digester.Hash()), decompressed)
> ++		return err
> ++	}(); err != nil {
> ++		return
> + 	}
> +-	decompressReader.Close()
> +-	decompressed.Close()
> +-	tempFile.Close()
> + 
> + 	// Determine the name that we should give to the uncompressed copy of the blob.
> + 	decompressedFilename := d.reference.blobPath(digester.Digest(), isConfig)
> +-	if err3 != nil {
> +-		return
> +-	}
> + 	// Rename the temporary file.
> + 	if err := os.Rename(tempFile.Name(), decompressedFilename); err != nil {
> + 		logrus.Debugf("error renaming new decompressed copy of blob %q into place at %q: %v", digester.Digest().String(), decompressedFilename, err)
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0005.patch b/recipes-containers/buildah/buildah/CVE-2024-3727-0005.patch
> new file mode 100644
> index 00000000..a3825303
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0005.patch
> @@ -0,0 +1,417 @@
> +From 086c7606314e6fa7638c36147a0e514c77a12008 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Miloslav=20Trma=C4=8D?= <mitr@redhat.com>
> +Date: Thu, 18 Apr 2024 00:14:38 +0200
> +Subject: [PATCH] Call .Validate() before digest.Digest.String() if necessary
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +... to prevent unexpected behavior on invalid values.
> +
> +Signed-off-by: Miloslav Trmač <mitr@redhat.com>
> +CVE: CVE-2024-3727
> +Upstream-Status: Backport [https://github.com/containers/image/commit/086c7606314e6fa7638c36147a0e514c77a12008]
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + docker/docker_client.go           | 20 +++++++++++++++++---
> + docker/docker_image_dest.go       | 11 ++++++++++-
> + docker/docker_image_src.go        |  8 ++++++++
> + docker/internal/tarfile/writer.go |  3 +++
> + openshift/openshift_src.go        |  3 +++
> + pkg/blobcache/blobcache.go        | 12 +++++++++---
> + pkg/blobcache/dest.go             | 15 ++++++++++++---
> + pkg/blobcache/src.go              | 16 ++++++++++++----
> + storage/storage_dest.go           | 12 ++++++++++--
> + storage/storage_image.go          |  7 +++++--
> + storage/storage_reference.go      | 10 ++++++++--
> + storage/storage_src.go            | 10 ++++++++--
> + 12 files changed, 105 insertions(+), 22 deletions(-)
> +
> +diff --git a/docker/docker_client.go b/docker/docker_client.go
> +index 6ce8f700..d03f87a0 100644
> +--- a/docker/docker_client.go
> ++++ b/docker/docker_client.go
> +@@ -952,6 +952,8 @@ func (c *dockerClient) detectProperties(ctx context.Context) error {
> + 	return c.detectPropertiesError
> + }
> + 
> ++// fetchManifest fetches a manifest for (the repo of ref) + tagOrDigest.
> ++// The caller is responsible for ensuring tagOrDigest uses the expected format.
> + func (c *dockerClient) fetchManifest(ctx context.Context, ref dockerReference, tagOrDigest string) ([]byte, string, error) {
> + 	path := fmt.Sprintf(manifestPath, reference.Path(ref.ref), tagOrDigest)
> + 	headers := map[string][]string{
> +@@ -1034,6 +1036,9 @@ func (c *dockerClient) getBlob(ctx context.Context, ref dockerReference, info ty
> + 		}
> + 	}
> + 
> ++	if err := info.Digest.Validate(); err != nil { // Make sure info.Digest.String() does not contain any unexpected characters
> ++		return nil, 0, err
> ++	}
> + 	path := fmt.Sprintf(blobsPath, reference.Path(ref.ref), info.Digest.String())
> + 	logrus.Debugf("Downloading %s", path)
> + 	res, err := c.makeRequest(ctx, http.MethodGet, path, nil, nil, v2Auth, nil)
> +@@ -1097,7 +1102,10 @@ func isManifestUnknownError(err error) bool {
> + // digest in ref.
> + // It returns (nil, nil) if the manifest does not exist.
> + func (c *dockerClient) getSigstoreAttachmentManifest(ctx context.Context, ref dockerReference, digest digest.Digest) (*manifest.OCI1, error) {
> +-	tag := sigstoreAttachmentTag(digest)
> ++	tag, err := sigstoreAttachmentTag(digest)
> ++	if err != nil {
> ++		return nil, err
> ++	}
> + 	sigstoreRef, err := reference.WithTag(reference.TrimNamed(ref.ref), tag)
> + 	if err != nil {
> + 		return nil, err
> +@@ -1130,6 +1138,9 @@ func (c *dockerClient) getSigstoreAttachmentManifest(ctx context.Context, ref do
> + // getExtensionsSignatures returns signatures from the X-Registry-Supports-Signatures API extension,
> + // using the original data structures.
> + func (c *dockerClient) getExtensionsSignatures(ctx context.Context, ref dockerReference, manifestDigest digest.Digest) (*extensionSignatureList, error) {
> ++	if err := manifestDigest.Validate(); err != nil { // Make sure manifestDigest.String() does not contain any unexpected characters
> ++		return nil, err
> ++	}
> + 	path := fmt.Sprintf(extensionsSignaturePath, reference.Path(ref.ref), manifestDigest)
> + 	res, err := c.makeRequest(ctx, http.MethodGet, path, nil, nil, v2Auth, nil)
> + 	if err != nil {
> +@@ -1153,8 +1164,11 @@ func (c *dockerClient) getExtensionsSignatures(ctx context.Context, ref dockerRe
> + }
> + 
> + // sigstoreAttachmentTag returns a sigstore attachment tag for the specified digest.
> +-func sigstoreAttachmentTag(d digest.Digest) string {
> +-	return strings.Replace(d.String(), ":", "-", 1) + ".sig"
> ++func sigstoreAttachmentTag(d digest.Digest) (string, error) {
> ++	if err := d.Validate(); err != nil { // Make sure d.String() doesn’t contain any unexpected characters
> ++		return "", err
> ++	}
> ++	return strings.Replace(d.String(), ":", "-", 1) + ".sig", nil
> + }
> + 
> + // Close removes resources associated with an initialized dockerClient, if any.
> +diff --git a/docker/docker_image_dest.go b/docker/docker_image_dest.go
> +index 682954fd..0c0505a8 100644
> +--- a/docker/docker_image_dest.go
> ++++ b/docker/docker_image_dest.go
> +@@ -229,6 +229,9 @@ func (d *dockerImageDestination) PutBlobWithOptions(ctx context.Context, stream
> + // If the destination does not contain the blob, or it is unknown, blobExists ordinarily returns (false, -1, nil);
> + // it returns a non-nil error only on an unexpected failure.
> + func (d *dockerImageDestination) blobExists(ctx context.Context, repo reference.Named, digest digest.Digest, extraScope *authScope) (bool, int64, error) {
> ++	if err := digest.Validate(); err != nil { // Make sure digest.String() does not contain any unexpected characters
> ++		return false, -1, err
> ++	}
> + 	checkPath := fmt.Sprintf(blobsPath, reference.Path(repo), digest.String())
> + 	logrus.Debugf("Checking %s", checkPath)
> + 	res, err := d.c.makeRequest(ctx, http.MethodHead, checkPath, nil, nil, v2Auth, extraScope)
> +@@ -466,6 +469,7 @@ func (d *dockerImageDestination) PutManifest(ctx context.Context, m []byte, inst
> + 		// particular instance.
> + 		refTail = instanceDigest.String()
> + 		// Double-check that the manifest we've been given matches the digest we've been given.
> ++		// This also validates the format of instanceDigest.
> + 		matches, err := manifest.MatchesDigest(m, *instanceDigest)
> + 		if err != nil {
> + 			return fmt.Errorf("digesting manifest in PutManifest: %w", err)
> +@@ -780,8 +784,12 @@ func (d *dockerImageDestination) putSignaturesToSigstoreAttachments(ctx context.
> + 	if err != nil {
> + 		return err
> + 	}
> ++	attachmentTag, err := sigstoreAttachmentTag(manifestDigest)
> ++	if err != nil {
> ++		return err
> ++	}
> + 	logrus.Debugf("Uploading sigstore attachment manifest")
> +-	return d.uploadManifest(ctx, manifestBlob, sigstoreAttachmentTag(manifestDigest))
> ++	return d.uploadManifest(ctx, manifestBlob, attachmentTag)
> + }
> + 
> + func layerMatchesSigstoreSignature(layer imgspecv1.Descriptor, mimeType string,
> +@@ -897,6 +905,7 @@ func (d *dockerImageDestination) putSignaturesToAPIExtension(ctx context.Context
> + 			return err
> + 		}
> + 
> ++		// manifestDigest is known to be valid because it was not rejected by getExtensionsSignatures above.
> + 		path := fmt.Sprintf(extensionsSignaturePath, reference.Path(d.ref.ref), manifestDigest.String())
> + 		res, err := d.c.makeRequest(ctx, http.MethodPut, path, nil, bytes.NewReader(body), v2Auth, nil)
> + 		if err != nil {
> +diff --git a/docker/docker_image_src.go b/docker/docker_image_src.go
> +index b78b9b51..274cd6dd 100644
> +--- a/docker/docker_image_src.go
> ++++ b/docker/docker_image_src.go
> +@@ -194,6 +194,9 @@ func simplifyContentType(contentType string) string {
> + // this never happens if the primary manifest is not a manifest list (e.g. if the source never returns manifest lists).
> + func (s *dockerImageSource) GetManifest(ctx context.Context, instanceDigest *digest.Digest) ([]byte, string, error) {
> + 	if instanceDigest != nil {
> ++		if err := instanceDigest.Validate(); err != nil { // Make sure instanceDigest.String() does not contain any unexpected characters
> ++			return nil, "", err
> ++		}
> + 		return s.fetchManifest(ctx, instanceDigest.String())
> + 	}
> + 	err := s.ensureManifestIsLoaded(ctx)
> +@@ -203,6 +206,8 @@ func (s *dockerImageSource) GetManifest(ctx context.Context, instanceDigest *dig
> + 	return s.cachedManifest, s.cachedManifestMIMEType, nil
> + }
> + 
> ++// fetchManifest fetches a manifest for tagOrDigest.
> ++// The caller is responsible for ensuring tagOrDigest uses the expected format.
> + func (s *dockerImageSource) fetchManifest(ctx context.Context, tagOrDigest string) ([]byte, string, error) {
> + 	return s.c.fetchManifest(ctx, s.physicalRef, tagOrDigest)
> + }
> +@@ -352,6 +357,9 @@ func (s *dockerImageSource) GetBlobAt(ctx context.Context, info types.BlobInfo,
> + 		return nil, nil, fmt.Errorf("external URLs not supported with GetBlobAt")
> + 	}
> + 
> ++	if err := info.Digest.Validate(); err != nil { // Make sure info.Digest.String() does not contain any unexpected characters
> ++		return nil, nil, err
> ++	}
> + 	path := fmt.Sprintf(blobsPath, reference.Path(s.physicalRef.ref), info.Digest.String())
> + 	logrus.Debugf("Downloading %s", path)
> + 	res, err := s.c.makeRequest(ctx, http.MethodGet, path, headers, nil, v2Auth, nil)
> +diff --git a/docker/internal/tarfile/writer.go b/docker/internal/tarfile/writer.go
> +index 2d83254d..7f6bd0e6 100644
> +--- a/docker/internal/tarfile/writer.go
> ++++ b/docker/internal/tarfile/writer.go
> +@@ -142,6 +142,9 @@ func (w *Writer) writeLegacyMetadataLocked(layerDescriptors []manifest.Schema2De
> + 		}
> + 
> + 		// This chainID value matches the computation in docker/docker/layer.CreateChainID …
> ++		if err := l.Digest.Validate(); err != nil { // This should never fail on this code path, still: make sure the chainID computation is unambiguous.
> ++			return err
> ++		}
> + 		if chainID == "" {
> + 			chainID = l.Digest
> + 		} else {
> +diff --git a/openshift/openshift_src.go b/openshift/openshift_src.go
> +index 0ac0127e..62774afb 100644
> +--- a/openshift/openshift_src.go
> ++++ b/openshift/openshift_src.go
> +@@ -109,6 +109,9 @@ func (s *openshiftImageSource) GetSignaturesWithFormat(ctx context.Context, inst
> + 		}
> + 		imageStreamImageName = s.imageStreamImageName
> + 	} else {
> ++		if err := instanceDigest.Validate(); err != nil { // Make sure instanceDigest.String() does not contain any unexpected characters
> ++			return nil, err
> ++		}
> + 		imageStreamImageName = instanceDigest.String()
> + 	}
> + 	image, err := s.client.getImage(ctx, imageStreamImageName)
> +diff --git a/pkg/blobcache/blobcache.go b/pkg/blobcache/blobcache.go
> +index 2bbf4884..f4de6ceb 100644
> +--- a/pkg/blobcache/blobcache.go
> ++++ b/pkg/blobcache/blobcache.go
> +@@ -78,12 +78,15 @@ func (b *BlobCache) DeleteImage(ctx context.Context, sys *types.SystemContext) e
> + }
> + 
> + // blobPath returns the path appropriate for storing a blob with digest.
> +-func (b *BlobCache) blobPath(digest digest.Digest, isConfig bool) string {
> ++func (b *BlobCache) blobPath(digest digest.Digest, isConfig bool) (string, error) {
> ++	if err := digest.Validate(); err != nil { // Make sure digest.String() does not contain any unexpected characters
> ++		return "", err
> ++	}
> + 	baseName := digest.String()
> + 	if isConfig {
> + 		baseName += ".config"
> + 	}
> +-	return filepath.Join(b.directory, baseName)
> ++	return filepath.Join(b.directory, baseName), nil
> + }
> + 
> + // findBlob checks if we have a blob for info in cache (whether a config or not)
> +@@ -95,7 +98,10 @@ func (b *BlobCache) findBlob(info types.BlobInfo) (string, int64, bool, error) {
> + 	}
> + 
> + 	for _, isConfig := range []bool{false, true} {
> +-		path := b.blobPath(info.Digest, isConfig)
> ++		path, err := b.blobPath(info.Digest, isConfig)
> ++		if err != nil {
> ++			return "", -1, false, err
> ++		}
> + 		fileInfo, err := os.Stat(path)
> + 		if err == nil && (info.Size == -1 || info.Size == fileInfo.Size()) {
> + 			return path, fileInfo.Size(), isConfig, nil
> +diff --git a/pkg/blobcache/dest.go b/pkg/blobcache/dest.go
> +index fde95974..bae16758 100644
> +--- a/pkg/blobcache/dest.go
> ++++ b/pkg/blobcache/dest.go
> +@@ -115,7 +115,10 @@ func (d *blobCacheDestination) saveStream(wg *sync.WaitGroup, decompressReader i
> + 	}
> + 
> + 	// Determine the name that we should give to the uncompressed copy of the blob.
> +-	decompressedFilename := d.reference.blobPath(digester.Digest(), isConfig)
> ++	decompressedFilename, err := d.reference.blobPath(digester.Digest(), isConfig)
> ++	if err != nil {
> ++		return
> ++	}
> + 	// Rename the temporary file.
> + 	if err := os.Rename(tempFile.Name(), decompressedFilename); err != nil {
> + 		logrus.Debugf("error renaming new decompressed copy of blob %q into place at %q: %v", digester.Digest().String(), decompressedFilename, err)
> +@@ -153,7 +156,10 @@ func (d *blobCacheDestination) PutBlobWithOptions(ctx context.Context, stream io
> + 	needToWait := false
> + 	compression := archive.Uncompressed
> + 	if inputInfo.Digest != "" {
> +-		filename := d.reference.blobPath(inputInfo.Digest, options.IsConfig)
> ++		filename, err2 := d.reference.blobPath(inputInfo.Digest, options.IsConfig)
> ++		if err2 != nil {
> ++			return private.UploadedBlob{}, err2
> ++		}
> + 		tempfile, err = os.CreateTemp(filepath.Dir(filename), filepath.Base(filename))
> + 		if err == nil {
> + 			stream = io.TeeReader(stream, tempfile)
> +@@ -282,7 +288,10 @@ func (d *blobCacheDestination) PutManifest(ctx context.Context, manifestBytes []
> + 	if err != nil {
> + 		logrus.Warnf("error digesting manifest %q: %v", string(manifestBytes), err)
> + 	} else {
> +-		filename := d.reference.blobPath(manifestDigest, false)
> ++		filename, err := d.reference.blobPath(manifestDigest, false)
> ++		if err != nil {
> ++			return err
> ++		}
> + 		if err = ioutils.AtomicWriteFile(filename, manifestBytes, 0600); err != nil {
> + 			logrus.Warnf("error saving manifest as %q: %v", filename, err)
> + 		}
> +diff --git a/pkg/blobcache/src.go b/pkg/blobcache/src.go
> +index 2fe108cd..600d2fa7 100644
> +--- a/pkg/blobcache/src.go
> ++++ b/pkg/blobcache/src.go
> +@@ -56,7 +56,10 @@ func (s *blobCacheSource) Close() error {
> + 
> + func (s *blobCacheSource) GetManifest(ctx context.Context, instanceDigest *digest.Digest) ([]byte, string, error) {
> + 	if instanceDigest != nil {
> +-		filename := s.reference.blobPath(*instanceDigest, false)
> ++		filename, err := s.reference.blobPath(*instanceDigest, false)
> ++		if err != nil {
> ++			return nil, "", err
> ++		}
> + 		manifestBytes, err := os.ReadFile(filename)
> + 		if err == nil {
> + 			s.cacheHits++
> +@@ -136,8 +139,10 @@ func (s *blobCacheSource) LayerInfosForCopy(ctx context.Context, instanceDigest
> + 		replacedInfos := make([]types.BlobInfo, 0, len(infos))
> + 		for _, info := range infos {
> + 			var replaceDigest []byte
> +-			var err error
> +-			blobFile := s.reference.blobPath(info.Digest, false)
> ++			blobFile, err := s.reference.blobPath(info.Digest, false)
> ++			if err != nil {
> ++				return nil, err
> ++			}
> + 			var alternate string
> + 			switch s.reference.compress {
> + 			case types.Compress:
> +@@ -148,7 +153,10 @@ func (s *blobCacheSource) LayerInfosForCopy(ctx context.Context, instanceDigest
> + 				replaceDigest, err = os.ReadFile(alternate)
> + 			}
> + 			if err == nil && digest.Digest(replaceDigest).Validate() == nil {
> +-				alternate = s.reference.blobPath(digest.Digest(replaceDigest), false)
> ++				alternate, err = s.reference.blobPath(digest.Digest(replaceDigest), false)
> ++				if err != nil {
> ++					return nil, err
> ++				}
> + 				fileInfo, err := os.Stat(alternate)
> + 				if err == nil {
> + 					switch info.MediaType {
> +diff --git a/storage/storage_dest.go b/storage/storage_dest.go
> +index b65be2e1..6b59be1f 100644
> +--- a/storage/storage_dest.go
> ++++ b/storage/storage_dest.go
> +@@ -803,8 +803,12 @@ func (s *storageImageDestination) Commit(ctx context.Context, unparsedToplevel t
> + 		if err != nil {
> + 			return fmt.Errorf("digesting top-level manifest: %w", err)
> + 		}
> ++		key, err := manifestBigDataKey(manifestDigest)
> ++		if err != nil {
> ++			return err
> ++		}
> + 		options.BigData = append(options.BigData, storage.ImageBigDataOption{
> +-			Key:    manifestBigDataKey(manifestDigest),
> ++			Key:    key,
> + 			Data:   toplevelManifest,
> + 			Digest: manifestDigest,
> + 		})
> +@@ -812,8 +816,12 @@ func (s *storageImageDestination) Commit(ctx context.Context, unparsedToplevel t
> + 	// Set up to save the image's manifest.  Allow looking it up by digest by using the key convention defined by the Store.
> + 	// Record the manifest twice: using a digest-specific key to allow references to that specific digest instance,
> + 	// and using storage.ImageDigestBigDataKey for future users that don’t specify any digest and for compatibility with older readers.
> ++	key, err := manifestBigDataKey(s.manifestDigest)
> ++	if err != nil {
> ++		return err
> ++	}
> + 	options.BigData = append(options.BigData, storage.ImageBigDataOption{
> +-		Key:    manifestBigDataKey(s.manifestDigest),
> ++		Key:    key,
> + 		Data:   s.manifest,
> + 		Digest: s.manifestDigest,
> + 	})
> +diff --git a/storage/storage_image.go b/storage/storage_image.go
> +index b734c412..ba25a0cb 100644
> +--- a/storage/storage_image.go
> ++++ b/storage/storage_image.go
> +@@ -26,8 +26,11 @@ type storageImageCloser struct {
> + // manifestBigDataKey returns a key suitable for recording a manifest with the specified digest using storage.Store.ImageBigData and related functions.
> + // If a specific manifest digest is explicitly requested by the user, the key returned by this function should be used preferably;
> + // for compatibility, if a manifest is not available under this key, check also storage.ImageDigestBigDataKey
> +-func manifestBigDataKey(digest digest.Digest) string {
> +-	return storage.ImageDigestManifestBigDataNamePrefix + "-" + digest.String()
> ++func manifestBigDataKey(digest digest.Digest) (string, error) {
> ++	if err := digest.Validate(); err != nil { // Make sure info.Digest.String() uses the expected format and does not collide with other BigData keys.
> ++		return "", err
> ++	}
> ++	return storage.ImageDigestManifestBigDataNamePrefix + "-" + digest.String(), nil
> + }
> + 
> + // signatureBigDataKey returns a key suitable for recording the signatures associated with the manifest with the specified digest using storage.Store.ImageBigData and related functions.
> +diff --git a/storage/storage_reference.go b/storage/storage_reference.go
> +index a55e3405..6b7565fd 100644
> +--- a/storage/storage_reference.go
> ++++ b/storage/storage_reference.go
> +@@ -73,7 +73,10 @@ func multiArchImageMatchesSystemContext(store storage.Store, img *storage.Image,
> + 	// We don't need to care about storage.ImageDigestBigDataKey because
> + 	// manifests lists are only stored into storage by c/image versions
> + 	// that know about manifestBigDataKey, and only using that key.
> +-	key := manifestBigDataKey(manifestDigest)
> ++	key, err := manifestBigDataKey(manifestDigest)
> ++	if err != nil {
> ++		return false // This should never happen, manifestDigest comes from a reference.Digested, and that validates the format.
> ++	}
> + 	manifestBytes, err := store.ImageBigData(img.ID, key)
> + 	if err != nil {
> + 		return false
> +@@ -95,7 +98,10 @@ func multiArchImageMatchesSystemContext(store storage.Store, img *storage.Image,
> + 	if err != nil {
> + 		return false
> + 	}
> +-	key = manifestBigDataKey(chosenInstance)
> ++	key, err = manifestBigDataKey(chosenInstance)
> ++	if err != nil {
> ++		return false
> ++	}
> + 	_, err = store.ImageBigData(img.ID, key)
> + 	return err == nil // true if img.ID is based on chosenInstance.
> + }
> +diff --git a/storage/storage_src.go b/storage/storage_src.go
> +index 29cce563..7e4b69f2 100644
> +--- a/storage/storage_src.go
> ++++ b/storage/storage_src.go
> +@@ -202,7 +202,10 @@ func (s *storageImageSource) getBlobAndLayerID(digest digest.Digest, layers []st
> + // GetManifest() reads the image's manifest.
> + func (s *storageImageSource) GetManifest(ctx context.Context, instanceDigest *digest.Digest) (manifestBlob []byte, mimeType string, err error) {
> + 	if instanceDigest != nil {
> +-		key := manifestBigDataKey(*instanceDigest)
> ++		key, err := manifestBigDataKey(*instanceDigest)
> ++		if err != nil {
> ++			return nil, "", err
> ++		}
> + 		blob, err := s.imageRef.transport.store.ImageBigData(s.image.ID, key)
> + 		if err != nil {
> + 			return nil, "", fmt.Errorf("reading manifest for image instance %q: %w", *instanceDigest, err)
> +@@ -214,7 +217,10 @@ func (s *storageImageSource) GetManifest(ctx context.Context, instanceDigest *di
> + 		// Prefer the manifest corresponding to the user-specified digest, if available.
> + 		if s.imageRef.named != nil {
> + 			if digested, ok := s.imageRef.named.(reference.Digested); ok {
> +-				key := manifestBigDataKey(digested.Digest())
> ++				key, err := manifestBigDataKey(digested.Digest())
> ++				if err != nil {
> ++					return nil, "", err
> ++				}
> + 				blob, err := s.imageRef.transport.store.ImageBigData(s.image.ID, key)
> + 				if err != nil && !os.IsNotExist(err) { // os.IsNotExist is true if the image exists but there is no data corresponding to key
> + 					return nil, "", err
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0006.patch b/recipes-containers/buildah/buildah/CVE-2024-3727-0006.patch
> new file mode 100644
> index 00000000..261005a9
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0006.patch
> @@ -0,0 +1,37 @@
> +From 6e25805f4bce855c85bb944b7dd1c0246dd02ad0 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Miloslav=20Trma=C4=8D?= <mitr@redhat.com>
> +Date: Thu, 18 Apr 2024 19:10:39 +0200
> +Subject: [PATCH] Validate the tags returned by a registry
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Miloslav Trmač <mitr@redhat.com>
> +CVE: CVE-2024-3727
> +Upstream-Status: Backport [https://github.com/containers/image/commit/6e25805f4bce855c85bb944b7dd1c0246dd02ad0]
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + docker/docker_image.go | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/docker/docker_image.go b/docker/docker_image.go
> +index 93160480..4c80bb2b 100644
> +--- a/docker/docker_image.go
> ++++ b/docker/docker_image.go
> +@@ -88,7 +88,12 @@ func GetRepositoryTags(ctx context.Context, sys *types.SystemContext, ref types.
> + 		if err = json.NewDecoder(res.Body).Decode(&tagsHolder); err != nil {
> + 			return nil, err
> + 		}
> +-		tags = append(tags, tagsHolder.Tags...)
> ++		for _, tag := range tagsHolder.Tags {
> ++			if _, err := reference.WithTag(dr.ref, tag); err != nil { // Ensure the tag does not contain unexpected values
> ++				return nil, fmt.Errorf("registry returned invalid tag %q: %w", tag, err)
> ++			}
> ++			tags = append(tags, tag)
> ++		}
> + 
> + 		link := res.Header.Get("Link")
> + 		if link == "" {
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index 90ffc238..ff3d44ea 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -33,6 +33,12 @@ SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
>  
>  SRC_URI = " \
>      git://github.com/containers/buildah;branch=release-1.34;name=buildah;protocol=https \
> +    file://CVE-2024-3727-0001.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/image/v5 \
> +    file://CVE-2024-3727-0002.patch;patchdir=src/github.com/containers/buildah \
> +    file://CVE-2024-3727-0003.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/image/v5 \
> +    file://CVE-2024-3727-0004.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/image/v5 \
> +    file://CVE-2024-3727-0005.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/image/v5 \
> +    file://CVE-2024-3727-0006.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/image/v5 \
>      "
>  
>  DEPENDS = "libdevmapper btrfs-tools gpgme"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8847): https://lists.yoctoproject.org/g/meta-virtualization/message/8847
> Mute This Topic: https://lists.yoctoproject.org/mt/107643601/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


