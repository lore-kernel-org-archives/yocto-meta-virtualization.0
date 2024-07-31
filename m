Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFF5C3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 10:30:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.39719.1722421825063975135
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 03:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89424512cb=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V9onoS025623
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Jul 2024 03:30:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40n0dfuns2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Jul 2024 03:30:23 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 03:30:21 -0700
From: <archana.polampalli@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][scarthgap][PATCH 1/1] buildah: fix CVE-2024-3727
Date: Wed, 31 Jul 2024 10:30:08 +0000
Message-ID: <20240731103008.1221210-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: UrcMsIBaURvOM15bQgcrGvHqMmLom-2i
X-Proofpoint-ORIG-GUID: UrcMsIBaURvOM15bQgcrGvHqMmLom-2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_07,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407310077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46V9onoS025623
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Jul 2024 10:30:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8847

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../buildah/buildah/CVE-2024-3727-0001.patch  |  54 ++
 .../buildah/buildah/CVE-2024-3727-0002.patch  | 573 ++++++++++++++++++
 .../buildah/buildah/CVE-2024-3727-0003.patch  |  96 +++
 .../buildah/buildah/CVE-2024-3727-0004.patch  |  84 +++
 .../buildah/buildah/CVE-2024-3727-0005.patch  | 417 +++++++++++++
 .../buildah/buildah/CVE-2024-3727-0006.patch  |  37 ++
 recipes-containers/buildah/buildah_git.bb     |   6 +
 7 files changed, 1267 insertions(+)
 create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0001=
.patch
 create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0002=
.patch
 create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0003=
.patch
 create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0004=
.patch
 create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0005=
.patch
 create mode 100644 recipes-containers/buildah/buildah/CVE-2024-3727-0006=
.patch

diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0001.patch =
b/recipes-containers/buildah/buildah/CVE-2024-3727-0001.patch
new file mode 100644
index 00000000..20fa091e
--- /dev/null
+++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0001.patch
@@ -0,0 +1,54 @@
+From 9c49ca12d641c8d75a0b70ee3f1989b81d760634 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Miloslav=3D20Trma=3DC4=3D8D?=3D <mitr@redhat.com>
+Date: Wed, 17 Jan 2024 23:29:52 +0100
+Subject: [PATCH] Validate digests before using them
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If doing it makes sense at all, it should happen before
+the values are used.
+
+Signed-off-by: Miloslav Trma=C4=8D <mitr@redhat.com>
+CVE: CVE-2024-3727
+Upstream-Status: Backport [https://github.com/containers/image/commit/9c=
49ca12d641c8d75a0b70ee3f1989b81d760634]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ storage/storage_dest.go | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/storage/storage_dest.go b/storage/storage_dest.go
+index 07e1d5e1..2a668aa5 100644
+--- a/storage/storage_dest.go
++++ b/storage/storage_dest.go
+@@ -324,6 +324,13 @@ func (s *storageImageDestination) TryReusingBlobWit=
hOptions(ctx context.Context,
+ // tryReusingBlobAsPending implements TryReusingBlobWithOptions for (di=
gest, size or -1), filling s.blobDiffIDs and other metadata.
+ // The caller must arrange the blob to be eventually committed using s.=
commitLayer().
+ func (s *storageImageDestination) tryReusingBlobAsPending(digest digest=
.Digest, size int64, options *private.TryReusingBlobOptions) (bool, priva=
te.ReusedBlob, error) {
++	if digest =3D=3D "" {
++		return false, private.ReusedBlob{}, errors.New(`Can not check for a b=
lob with unknown digest`)
++	}
++	if err :=3D digest.Validate(); err !=3D nil {
++		return false, private.ReusedBlob{}, fmt.Errorf("Can not check for a b=
lob with invalid digest: %w", err)
++	}
++
+ 	// lock the entire method as it executes fairly quickly
+ 	s.lock.Lock()
+ 	defer s.lock.Unlock()
+@@ -344,13 +351,6 @@ func (s *storageImageDestination) tryReusingBlobAsP=
ending(digest digest.Digest,
+ 		}
+ 	}
+=20
+-	if digest =3D=3D "" {
+-		return false, private.ReusedBlob{}, errors.New(`Can not check for a b=
lob with unknown digest`)
+-	}
+-	if err :=3D digest.Validate(); err !=3D nil {
+-		return false, private.ReusedBlob{}, fmt.Errorf("Can not check for a b=
lob with invalid digest: %w", err)
+-	}
+-
+ 	// Check if we've already cached it in a file.
+ 	if size, ok :=3D s.fileSizes[digest]; ok {
+ 		return true, private.ReusedBlob{
+--=20
+2.40.0
+
diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0002.patch =
b/recipes-containers/buildah/buildah/CVE-2024-3727-0002.patch
new file mode 100644
index 00000000..774f145f
--- /dev/null
+++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0002.patch
@@ -0,0 +1,573 @@
+From af94ba17ceb184256966edd7d71b10aad2972156 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Miloslav=3D20Trma=3DC4=3D8D?=3D <mitr@redhat.com>
+Date: Wed, 17 Apr 2024 22:26:46 +0200
+Subject: [PATCH] Call .Validate() before digest.Hex() / digest.Encoded()
+ MIME-Version: 1.0 Content-Type: text/plain; charset=3DUTF-8
+ Content-Transfer-Encoding: 8bit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+... to prevent panics if the value does not contain a :, or other unexpe=
cted
+values (e.g. a path traversal).
+
+Don't bother on paths where we computed the digest ourselves, or it is a=
lready trusted
+for other reasons.
+
+Signed-off-by: Miloslav Trma=C4=8D <mitr@redhat.com>
+CVE: CVE-2024-3727
+Upstream-Status: Backport [https://github.com/containers/image/commit/af=
94ba17ceb184256966edd7d71b10aad2972156]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ .../containers/image/v5/copy/progress_bars.go |  7 +++-
+ .../containers/image/v5/copy/single.go        | 39 ++++++++++++++-----
+ .../image/v5/directory/directory_dest.go      | 22 +++++++++--
+ .../image/v5/directory/directory_src.go       | 17 ++++++--
+ .../image/v5/directory/directory_transport.go | 25 ++++++++----
+ .../image/v5/docker/docker_image_dest.go      | 11 ++++--
+ .../image/v5/docker/docker_image_src.go       | 10 ++++-
+ .../image/v5/docker/internal/tarfile/dest.go  | 12 +++++-
+ .../v5/docker/internal/tarfile/writer.go      | 31 +++++++++++----
+ .../image/v5/docker/registries_d.go           |  7 +++-
+ .../containers/image/v5/ostree/ostree_dest.go | 10 +++++
+ .../containers/image/v5/ostree/ostree_src.go  |  4 +-
+ .../image/v5/storage/storage_dest.go          |  6 ++-
+ .../image/v5/storage/storage_image.go         |  7 +++-
+ .../image/v5/storage/storage_src.go           |  9 ++++-
+ 15 files changed, 169 insertions(+), 48 deletions(-)
+
+diff --git a/vendor/github.com/containers/image/v5/copy/progress_bars.go=
 b/vendor/github.com/containers/image/v5/copy/progress_bars.go
+index ce078234c..ba6a27389 100644
+--- a/vendor/github.com/containers/image/v5/copy/progress_bars.go
++++ b/vendor/github.com/containers/image/v5/copy/progress_bars.go
+@@ -48,10 +48,13 @@ type progressBar struct {
+ // As a convention, most users of progress bars should call mark100Perc=
entComplete on full success;
+ // by convention, we don't leave progress bars in partial state when fu=
lly done
+ // (even if we copied much less data than anticipated).
+-func (c *copier) createProgressBar(pool *mpb.Progress, partial bool, in=
fo types.BlobInfo, kind string, onComplete string) *progressBar {
++func (c *copier) createProgressBar(pool *mpb.Progress, partial bool, in=
fo types.BlobInfo, kind string, onComplete string) (*progressBar, error) =
{
+ 	// shortDigestLen is the length of the digest used for blobs.
+ 	const shortDigestLen =3D 12
+=20
++	if err :=3D info.Digest.Validate(); err !=3D nil { // digest.Digest.En=
coded() panics on failure, so validate explicitly.
++		return nil, err
++	}
+ 	prefix :=3D fmt.Sprintf("Copying %s %s", kind, info.Digest.Encoded())
+ 	// Truncate the prefix (chopping of some part of the digest) to make a=
ll progress bars aligned in a column.
+ 	maxPrefixLen :=3D len("Copying blob ") + shortDigestLen
+@@ -104,7 +107,7 @@ func (c *copier) createProgressBar(pool *mpb.Progres=
s, partial bool, info types.
+ 	return &progressBar{
+ 		Bar:          bar,
+ 		originalSize: info.Size,
+-	}
++	}, nil
+ }
+=20
+ // printCopyInfo prints a "Copying ..." message on the copier if the ou=
tput is
+diff --git a/vendor/github.com/containers/image/v5/copy/single.go b/vend=
or/github.com/containers/image/v5/copy/single.go
+index 67ca43f7b..d36b8542d 100644
+--- a/vendor/github.com/containers/image/v5/copy/single.go
++++ b/vendor/github.com/containers/image/v5/copy/single.go
+@@ -599,7 +599,10 @@ func (ic *imageCopier) copyConfig(ctx context.Conte=
xt, src types.Image) error {
+ 		destInfo, err :=3D func() (types.BlobInfo, error) { // A scope for de=
fer
+ 			progressPool :=3D ic.c.newProgressPool()
+ 			defer progressPool.Wait()
+-			bar :=3D ic.c.createProgressBar(progressPool, false, srcInfo, "confi=
g", "done")
++			bar, err :=3D ic.c.createProgressBar(progressPool, false, srcInfo, "=
config", "done")
++			if err !=3D nil {
++				return types.BlobInfo{}, err
++			}
+ 			defer bar.Abort(false)
+ 			ic.c.printCopyInfo("config", srcInfo)
+=20
+@@ -707,11 +710,17 @@ func (ic *imageCopier) copyLayer(ctx context.Conte=
xt, srcInfo types.BlobInfo, to
+ 		}
+ 		if reused {
+ 			logrus.Debugf("Skipping blob %s (already present):", srcInfo.Digest)
+-			func() { // A scope for defer
+-				bar :=3D ic.c.createProgressBar(pool, false, types.BlobInfo{Digest:=
 reusedBlob.Digest, Size: 0}, "blob", "skipped: already exists")
++			if err :=3D func() error { // A scope for defer
++				bar, err :=3D ic.c.createProgressBar(pool, false, types.BlobInfo{Di=
gest: reusedBlob.Digest, Size: 0}, "blob", "skipped: already exists")
++				if err !=3D nil {
++					return err
++				}
+ 				defer bar.Abort(false)
+ 				bar.mark100PercentComplete()
+-			}()
++				return nil
++			}(); err !=3D nil {
++				return types.BlobInfo{}, "", err
++			}
+=20
+ 			// Throw an event that the layer has been skipped
+ 			if ic.c.options.Progress !=3D nil && ic.c.options.ProgressInterval >=
 0 {
+@@ -730,8 +739,11 @@ func (ic *imageCopier) copyLayer(ctx context.Contex=
t, srcInfo types.BlobInfo, to
+ 	// Attempt a partial only when the source allows to retrieve a blob pa=
rtially and
+ 	// the destination has support for it.
+ 	if canAvoidProcessingCompleteLayer && ic.c.rawSource.SupportsGetBlobAt=
() && ic.c.dest.SupportsPutBlobPartial() {
+-		if reused, blobInfo :=3D func() (bool, types.BlobInfo) { // A scope f=
or defer
+-			bar :=3D ic.c.createProgressBar(pool, true, srcInfo, "blob", "done")
++		reused, blobInfo, err :=3D func() (bool, types.BlobInfo, error) { // =
A scope for defer
++			bar, err :=3D ic.c.createProgressBar(pool, true, srcInfo, "blob", "d=
one")
++			if err !=3D nil {
++				return false, types.BlobInfo{}, err
++			}
+ 			hideProgressBar :=3D true
+ 			defer func() { // Note that this is not the same as defer bar.Abort(=
hideProgressBar); we need hideProgressBar to be evaluated lazily.
+ 				bar.Abort(hideProgressBar)
+@@ -751,18 +763,25 @@ func (ic *imageCopier) copyLayer(ctx context.Conte=
xt, srcInfo types.BlobInfo, to
+ 				bar.mark100PercentComplete()
+ 				hideProgressBar =3D false
+ 				logrus.Debugf("Retrieved partial blob %v", srcInfo.Digest)
+-				return true, updatedBlobInfoFromUpload(srcInfo, uploadedBlob)
++				return true, updatedBlobInfoFromUpload(srcInfo, uploadedBlob), nil
+ 			}
+ 			logrus.Debugf("Failed to retrieve partial blob: %v", err)
+-			return false, types.BlobInfo{}
+-		}(); reused {
++			return false, types.BlobInfo{}, nil
++		}()
++		if err !=3D nil {
++			return types.BlobInfo{}, "", err
++		}
++		if reused {
+ 			return blobInfo, cachedDiffID, nil
+ 		}
+ 	}
+=20
+ 	// Fallback: copy the layer, computing the diffID if we need to do so
+ 	return func() (types.BlobInfo, digest.Digest, error) { // A scope for =
defer
+-		bar :=3D ic.c.createProgressBar(pool, false, srcInfo, "blob", "done")
++		bar, err :=3D ic.c.createProgressBar(pool, false, srcInfo, "blob", "d=
one")
++		if err !=3D nil {
++			return types.BlobInfo{}, "", err
++		}
+ 		defer bar.Abort(false)
+=20
+ 		srcStream, srcBlobSize, err :=3D ic.c.rawSource.GetBlob(ctx, srcInfo,=
 ic.c.blobInfoCache)
+diff --git a/vendor/github.com/containers/image/v5/directory/directory_d=
est.go b/vendor/github.com/containers/image/v5/directory/directory_dest.g=
o
+index 222723a8f..d32877e0c 100644
+--- a/vendor/github.com/containers/image/v5/directory/directory_dest.go
++++ b/vendor/github.com/containers/image/v5/directory/directory_dest.go
+@@ -173,7 +173,10 @@ func (d *dirImageDestination) PutBlobWithOptions(ct=
x context.Context, stream io.
+ 		}
+ 	}
+=20
+-	blobPath :=3D d.ref.layerPath(blobDigest)
++	blobPath, err :=3D d.ref.layerPath(blobDigest)
++	if err !=3D nil {
++		return private.UploadedBlob{}, err
++	}
+ 	// need to explicitly close the file, since a rename won't otherwise n=
ot work on Windows
+ 	blobFile.Close()
+ 	explicitClosed =3D true
+@@ -196,7 +199,10 @@ func (d *dirImageDestination) TryReusingBlobWithOpt=
ions(ctx context.Context, inf
+ 	if info.Digest =3D=3D "" {
+ 		return false, private.ReusedBlob{}, fmt.Errorf("Can not check for a b=
lob with unknown digest")
+ 	}
+-	blobPath :=3D d.ref.layerPath(info.Digest)
++	blobPath, err :=3D d.ref.layerPath(info.Digest)
++	if err !=3D nil {
++		return false, private.ReusedBlob{}, err
++	}
+ 	finfo, err :=3D os.Stat(blobPath)
+ 	if err !=3D nil && os.IsNotExist(err) {
+ 		return false, private.ReusedBlob{}, nil
+@@ -216,7 +222,11 @@ func (d *dirImageDestination) TryReusingBlobWithOpt=
ions(ctx context.Context, inf
+ // If the destination is in principle available, refuses this manifest =
type (e.g. it does not recognize the schema),
+ // but may accept a different manifest type, the returned error must be=
 an ManifestTypeRejectedError.
+ func (d *dirImageDestination) PutManifest(ctx context.Context, manifest=
 []byte, instanceDigest *digest.Digest) error {
+-	return os.WriteFile(d.ref.manifestPath(instanceDigest), manifest, 0644=
)
++	path, err :=3D d.ref.manifestPath(instanceDigest)
++	if err !=3D nil {
++		return err
++	}
++	return os.WriteFile(path, manifest, 0644)
+ }
+=20
+ // PutSignaturesWithFormat writes a set of signatures to the destinatio=
n.
+@@ -229,7 +239,11 @@ func (d *dirImageDestination) PutSignaturesWithForm=
at(ctx context.Context, signa
+ 		if err !=3D nil {
+ 			return err
+ 		}
+-		if err :=3D os.WriteFile(d.ref.signaturePath(i, instanceDigest), blob=
, 0644); err !=3D nil {
++		path, err :=3D d.ref.signaturePath(i, instanceDigest)
++		if err !=3D nil {
++			return err
++		}
++		if err :=3D os.WriteFile(path, blob, 0644); err !=3D nil {
+ 			return err
+ 		}
+ 	}
+diff --git a/vendor/github.com/containers/image/v5/directory/directory_s=
rc.go b/vendor/github.com/containers/image/v5/directory/directory_src.go
+index 5fc83bb6f..6d725bcfa 100644
+--- a/vendor/github.com/containers/image/v5/directory/directory_src.go
++++ b/vendor/github.com/containers/image/v5/directory/directory_src.go
+@@ -55,7 +55,11 @@ func (s *dirImageSource) Close() error {
+ // If instanceDigest is not nil, it contains a digest of the specific m=
anifest instance to retrieve (when the primary manifest is a manifest lis=
t);
+ // this never happens if the primary manifest is not a manifest list (e=
.g. if the source never returns manifest lists).
+ func (s *dirImageSource) GetManifest(ctx context.Context, instanceDiges=
t *digest.Digest) ([]byte, string, error) {
+-	m, err :=3D os.ReadFile(s.ref.manifestPath(instanceDigest))
++	path, err :=3D s.ref.manifestPath(instanceDigest)
++	if err !=3D nil {
++		return nil, "", err
++	}
++	m, err :=3D os.ReadFile(path)
+ 	if err !=3D nil {
+ 		return nil, "", err
+ 	}
+@@ -66,7 +70,11 @@ func (s *dirImageSource) GetManifest(ctx context.Cont=
ext, instanceDigest *digest
+ // The Digest field in BlobInfo is guaranteed to be provided, Size may =
be -1 and MediaType may be optionally provided.
+ // May update BlobInfoCache, preferably after it knows for certain that=
 a blob truly exists at a specific location.
+ func (s *dirImageSource) GetBlob(ctx context.Context, info types.BlobIn=
fo, cache types.BlobInfoCache) (io.ReadCloser, int64, error) {
+-	r, err :=3D os.Open(s.ref.layerPath(info.Digest))
++	path, err :=3D s.ref.layerPath(info.Digest)
++	if err !=3D nil {
++		return nil, -1, err
++	}
++	r, err :=3D os.Open(path)
+ 	if err !=3D nil {
+ 		return nil, -1, err
+ 	}
+@@ -84,7 +92,10 @@ func (s *dirImageSource) GetBlob(ctx context.Context,=
 info types.BlobInfo, cache
+ func (s *dirImageSource) GetSignaturesWithFormat(ctx context.Context, i=
nstanceDigest *digest.Digest) ([]signature.Signature, error) {
+ 	signatures :=3D []signature.Signature{}
+ 	for i :=3D 0; ; i++ {
+-		path :=3D s.ref.signaturePath(i, instanceDigest)
++		path, err :=3D s.ref.signaturePath(i, instanceDigest)
++		if err !=3D nil {
++			return nil, err
++		}
+ 		sigBlob, err :=3D os.ReadFile(path)
+ 		if err !=3D nil {
+ 			if os.IsNotExist(err) {
+diff --git a/vendor/github.com/containers/image/v5/directory/directory_t=
ransport.go b/vendor/github.com/containers/image/v5/directory/directory_t=
ransport.go
+index 7e3068693..4f7d596b4 100644
+--- a/vendor/github.com/containers/image/v5/directory/directory_transpor=
t.go
++++ b/vendor/github.com/containers/image/v5/directory/directory_transpor=
t.go
+@@ -161,25 +161,34 @@ func (ref dirReference) DeleteImage(ctx context.Co=
ntext, sys *types.SystemContex
+ }
+=20
+ // manifestPath returns a path for the manifest within a directory usin=
g our conventions.
+-func (ref dirReference) manifestPath(instanceDigest *digest.Digest) str=
ing {
++func (ref dirReference) manifestPath(instanceDigest *digest.Digest) (st=
ring, error) {
+ 	if instanceDigest !=3D nil {
+-		return filepath.Join(ref.path, instanceDigest.Encoded()+".manifest.js=
on")
++		if err :=3D instanceDigest.Validate(); err !=3D nil { // digest.Diges=
t.Encoded() panics on failure, and could possibly result in a path with .=
./, so validate explicitly.
++			return "", err
++		}
++		return filepath.Join(ref.path, instanceDigest.Encoded()+".manifest.js=
on"), nil
+ 	}
+-	return filepath.Join(ref.path, "manifest.json")
++	return filepath.Join(ref.path, "manifest.json"), nil
+ }
+=20
+ // layerPath returns a path for a layer tarball within a directory usin=
g our conventions.
+-func (ref dirReference) layerPath(digest digest.Digest) string {
++func (ref dirReference) layerPath(digest digest.Digest) (string, error)=
 {
++	if err :=3D digest.Validate(); err !=3D nil { // digest.Digest.Encoded=
() panics on failure, and could possibly result in a path with ../, so va=
lidate explicitly.
++		return "", err
++	}
+ 	// FIXME: Should we keep the digest identification?
+-	return filepath.Join(ref.path, digest.Encoded())
++	return filepath.Join(ref.path, digest.Encoded()), nil
+ }
+=20
+ // signaturePath returns a path for a signature within a directory usin=
g our conventions.
+-func (ref dirReference) signaturePath(index int, instanceDigest *digest=
.Digest) string {
++func (ref dirReference) signaturePath(index int, instanceDigest *digest=
.Digest) (string, error) {
+ 	if instanceDigest !=3D nil {
+-		return filepath.Join(ref.path, fmt.Sprintf(instanceDigest.Encoded()+"=
.signature-%d", index+1))
++		if err :=3D instanceDigest.Validate(); err !=3D nil { // digest.Diges=
t.Encoded() panics on failure, and could possibly result in a path with .=
./, so validate explicitly.
++			return "", err
++		}
++		return filepath.Join(ref.path, fmt.Sprintf(instanceDigest.Encoded()+"=
.signature-%d", index+1)), nil
+ 	}
+-	return filepath.Join(ref.path, fmt.Sprintf("signature-%d", index+1))
++	return filepath.Join(ref.path, fmt.Sprintf("signature-%d", index+1)), =
nil
+ }
+=20
+ // versionPath returns a path for the version file within a directory u=
sing our conventions.
+diff --git a/vendor/github.com/containers/image/v5/docker/docker_image_d=
est.go b/vendor/github.com/containers/image/v5/docker/docker_image_dest.g=
o
+index 774068c27..0e07fd558 100644
+--- a/vendor/github.com/containers/image/v5/docker/docker_image_dest.go
++++ b/vendor/github.com/containers/image/v5/docker/docker_image_dest.go
+@@ -624,11 +624,13 @@ func (d *dockerImageDestination) putSignaturesToLo=
okaside(signatures []signature
+=20
+ 	// NOTE: Keep this in sync with docs/signature-protocols.md!
+ 	for i, signature :=3D range signatures {
+-		sigURL :=3D lookasideStorageURL(d.c.signatureBase, manifestDigest, i)
+-		err :=3D d.putOneSignature(sigURL, signature)
++		sigURL, err :=3D lookasideStorageURL(d.c.signatureBase, manifestDiges=
t, i)
+ 		if err !=3D nil {
+ 			return err
+ 		}
++		if err :=3D d.putOneSignature(sigURL, signature); err !=3D nil {
++			return err
++		}
+ 	}
+ 	// Remove any other signatures, if present.
+ 	// We stop at the first missing signature; if a previous deleting loop=
 aborted
+@@ -636,7 +638,10 @@ func (d *dockerImageDestination) putSignaturesToLoo=
kaside(signatures []signature
+ 	// is enough for dockerImageSource to stop looking for other signature=
s, so that
+ 	// is sufficient.
+ 	for i :=3D len(signatures); ; i++ {
+-		sigURL :=3D lookasideStorageURL(d.c.signatureBase, manifestDigest, i)
++		sigURL, err :=3D lookasideStorageURL(d.c.signatureBase, manifestDiges=
t, i)
++		if err !=3D nil {
++			return err
++		}
+ 		missing, err :=3D d.c.deleteOneSignature(sigURL)
+ 		if err !=3D nil {
+ 			return err
+diff --git a/vendor/github.com/containers/image/v5/docker/docker_image_s=
rc.go b/vendor/github.com/containers/image/v5/docker/docker_image_src.go
+index 231d5d212..4a5348774 100644
+--- a/vendor/github.com/containers/image/v5/docker/docker_image_src.go
++++ b/vendor/github.com/containers/image/v5/docker/docker_image_src.go
+@@ -457,7 +457,10 @@ func (s *dockerImageSource) getSignaturesFromLookas=
ide(ctx context.Context, inst
+ 			return nil, fmt.Errorf("server provided %d signatures, assuming that=
's unreasonable and a server error", maxLookasideSignatures)
+ 		}
+=20
+-		sigURL :=3D lookasideStorageURL(s.c.signatureBase, manifestDigest, i)
++		sigURL, err :=3D lookasideStorageURL(s.c.signatureBase, manifestDiges=
t, i)
++		if err !=3D nil {
++			return nil, err
++		}
+ 		signature, missing, err :=3D s.getOneSignature(ctx, sigURL)
+ 		if err !=3D nil {
+ 			return nil, err
+@@ -651,7 +654,10 @@ func deleteImage(ctx context.Context, sys *types.Sy=
stemContext, ref dockerRefere
+ 	}
+=20
+ 	for i :=3D 0; ; i++ {
+-		sigURL :=3D lookasideStorageURL(c.signatureBase, manifestDigest, i)
++		sigURL, err :=3D lookasideStorageURL(c.signatureBase, manifestDigest,=
 i)
++		if err !=3D nil {
++			return err
++		}
+ 		missing, err :=3D c.deleteOneSignature(sigURL)
+ 		if err !=3D nil {
+ 			return err
+diff --git a/vendor/github.com/containers/image/v5/docker/internal/tarfi=
le/dest.go b/vendor/github.com/containers/image/v5/docker/internal/tarfil=
e/dest.go
+index 7507d8559..106490cb3 100644
+--- a/vendor/github.com/containers/image/v5/docker/internal/tarfile/dest=
.go
++++ b/vendor/github.com/containers/image/v5/docker/internal/tarfile/dest=
.go
+@@ -111,11 +111,19 @@ func (d *Destination) PutBlobWithOptions(ctx conte=
xt.Context, stream io.Reader,
+ 			return private.UploadedBlob{}, fmt.Errorf("reading Config file strea=
m: %w", err)
+ 		}
+ 		d.config =3D buf
+-		if err :=3D d.archive.sendFileLocked(d.archive.configPath(inputInfo.D=
igest), inputInfo.Size, bytes.NewReader(buf)); err !=3D nil {
++		configPath, err :=3D d.archive.configPath(inputInfo.Digest)
++		if err !=3D nil {
++			return private.UploadedBlob{}, err
++		}
++		if err :=3D d.archive.sendFileLocked(configPath, inputInfo.Size, byte=
s.NewReader(buf)); err !=3D nil {
+ 			return private.UploadedBlob{}, fmt.Errorf("writing Config file: %w",=
 err)
+ 		}
+ 	} else {
+-		if err :=3D d.archive.sendFileLocked(d.archive.physicalLayerPath(inpu=
tInfo.Digest), inputInfo.Size, stream); err !=3D nil {
++		layerPath, err :=3D d.archive.physicalLayerPath(inputInfo.Digest)
++		if err !=3D nil {
++			return private.UploadedBlob{}, err
++		}
++		if err :=3D d.archive.sendFileLocked(layerPath, inputInfo.Size, strea=
m); err !=3D nil {
+ 			return private.UploadedBlob{}, err
+ 		}
+ 	}
+diff --git a/vendor/github.com/containers/image/v5/docker/internal/tarfi=
le/writer.go b/vendor/github.com/containers/image/v5/docker/internal/tarf=
ile/writer.go
+index df7b2c090..2d83254d7 100644
+--- a/vendor/github.com/containers/image/v5/docker/internal/tarfile/writ=
er.go
++++ b/vendor/github.com/containers/image/v5/docker/internal/tarfile/writ=
er.go
+@@ -95,7 +95,10 @@ func (w *Writer) ensureSingleLegacyLayerLocked(layerI=
D string, layerDigest diges
+ 	if !w.legacyLayers.Contains(layerID) {
+ 		// Create a symlink for the legacy format, where there is one subdire=
ctory per layer ("image").
+ 		// See also the comment in physicalLayerPath.
+-		physicalLayerPath :=3D w.physicalLayerPath(layerDigest)
++		physicalLayerPath, err :=3D w.physicalLayerPath(layerDigest)
++		if err !=3D nil {
++			return err
++		}
+ 		if err :=3D w.sendSymlinkLocked(filepath.Join(layerID, legacyLayerFil=
eName), filepath.Join("..", physicalLayerPath)); err !=3D nil {
+ 			return fmt.Errorf("creating layer symbolic link: %w", err)
+ 		}
+@@ -204,12 +207,20 @@ func checkManifestItemsMatch(a, b *ManifestItem) e=
rror {
+ func (w *Writer) ensureManifestItemLocked(layerDescriptors []manifest.S=
chema2Descriptor, configDigest digest.Digest, repoTags []reference.NamedT=
agged) error {
+ 	layerPaths :=3D []string{}
+ 	for _, l :=3D range layerDescriptors {
+-		layerPaths =3D append(layerPaths, w.physicalLayerPath(l.Digest))
++		p, err :=3D w.physicalLayerPath(l.Digest)
++		if err !=3D nil {
++			return err
++		}
++		layerPaths =3D append(layerPaths, p)
+ 	}
+=20
+ 	var item *ManifestItem
++	configPath, err :=3D w.configPath(configDigest)
++	if err !=3D nil {
++		return err
++	}
+ 	newItem :=3D ManifestItem{
+-		Config:       w.configPath(configDigest),
++		Config:       configPath,
+ 		RepoTags:     []string{},
+ 		Layers:       layerPaths,
+ 		Parent:       "", // We don=E2=80=99t have this information
+@@ -294,21 +305,27 @@ func (w *Writer) Close() error {
+ // configPath returns a path we choose for storing a config with the sp=
ecified digest.
+ // NOTE: This is an internal implementation detail, not a format proper=
ty, and can change
+ // any time.
+-func (w *Writer) configPath(configDigest digest.Digest) string {
+-	return configDigest.Hex() + ".json"
++func (w *Writer) configPath(configDigest digest.Digest) (string, error)=
 {
++	if err :=3D configDigest.Validate(); err !=3D nil { // digest.Digest.H=
ex() panics on failure, and could possibly result in unexpected paths, so=
 validate explicitly.
++		return "", err
++	}
++	return configDigest.Hex() + ".json", nil
+ }
+=20
+ // physicalLayerPath returns a path we choose for storing a layer with =
the specified digest
+ // (the actual path, i.e. a regular file, not a symlink that may be use=
d in the legacy format).
+ // NOTE: This is an internal implementation detail, not a format proper=
ty, and can change
+ // any time.
+-func (w *Writer) physicalLayerPath(layerDigest digest.Digest) string {
++func (w *Writer) physicalLayerPath(layerDigest digest.Digest) (string, =
error) {
++	if err :=3D layerDigest.Validate(); err !=3D nil { // digest.Digest.He=
x() panics on failure, and could possibly result in unexpected paths, so =
validate explicitly.
++		return "", err
++	}
+ 	// Note that this can't be e.g. filepath.Join(l.Digest.Hex(), legacyLa=
yerFileName); due to the way
+ 	// writeLegacyMetadata constructs layer IDs differently from inputinfo=
.Digest values (as described
+ 	// inside it), most of the layers would end up in subdirectories alone=
 without any metadata; (docker load)
+ 	// tries to load every subdirectory as an image and fails if the confi=
g is missing.  So, keep the layers
+ 	// in the root of the tarball.
+-	return layerDigest.Hex() + ".tar"
++	return layerDigest.Hex() + ".tar", nil
+ }
+=20
+ type tarFI struct {
+diff --git a/vendor/github.com/containers/image/v5/docker/registries_d.g=
o b/vendor/github.com/containers/image/v5/docker/registries_d.go
+index c7b884ab3..9d651d9bd 100644
+--- a/vendor/github.com/containers/image/v5/docker/registries_d.go
++++ b/vendor/github.com/containers/image/v5/docker/registries_d.go
+@@ -286,8 +286,11 @@ func (ns registryNamespace) signatureTopLevel(write=
 bool) string {
+ // lookasideStorageURL returns an URL usable for accessing signature in=
dex in base with known manifestDigest.
+ // base is not nil from the caller
+ // NOTE: Keep this in sync with docs/signature-protocols.md!
+-func lookasideStorageURL(base lookasideStorageBase, manifestDigest dige=
st.Digest, index int) *url.URL {
++func lookasideStorageURL(base lookasideStorageBase, manifestDigest dige=
st.Digest, index int) (*url.URL, error) {
++	if err :=3D manifestDigest.Validate(); err !=3D nil { // digest.Digest=
.Hex() panics on failure, and could possibly result in a path with ../, s=
o validate explicitly.
++		return nil, err
++	}
+ 	sigURL :=3D *base
+ 	sigURL.Path =3D fmt.Sprintf("%s@%s=3D%s/signature-%d", sigURL.Path, ma=
nifestDigest.Algorithm(), manifestDigest.Hex(), index+1)
+-	return &sigURL
++	return &sigURL, nil
+ }
+diff --git a/vendor/github.com/containers/image/v5/ostree/ostree_dest.go=
 b/vendor/github.com/containers/image/v5/ostree/ostree_dest.go
+index d00a0cdf8..29177f11a 100644
+--- a/vendor/github.com/containers/image/v5/ostree/ostree_dest.go
++++ b/vendor/github.com/containers/image/v5/ostree/ostree_dest.go
+@@ -345,6 +345,10 @@ func (d *ostreeImageDestination) TryReusingBlobWith=
Options(ctx context.Context,
+ 		}
+ 		d.repo =3D repo
+ 	}
++
++	if err :=3D info.Digest.Validate(); err !=3D nil { // digest.Digest.He=
x() panics on failure, so validate explicitly.
++		return false, private.ReusedBlob{}, err
++	}
+ 	branch :=3D fmt.Sprintf("ociimage/%s", info.Digest.Hex())
+=20
+ 	found, data, err :=3D readMetadata(d.repo, branch, "docker.uncompresse=
d_digest")
+@@ -470,12 +474,18 @@ func (d *ostreeImageDestination) Commit(context.Co=
ntext, types.UnparsedImage) er
+ 		return nil
+ 	}
+ 	for _, layer :=3D range d.schema.LayersDescriptors {
++		if err :=3D layer.Digest.Validate(); err !=3D nil { // digest.Digest.=
Encoded() panics on failure, so validate explicitly.
++			return err
++		}
+ 		hash :=3D layer.Digest.Hex()
+ 		if err =3D checkLayer(hash); err !=3D nil {
+ 			return err
+ 		}
+ 	}
+ 	for _, layer :=3D range d.schema.FSLayers {
++		if err :=3D layer.BlobSum.Validate(); err !=3D nil { // digest.Digest=
.Encoded() panics on failure, so validate explicitly.
++			return err
++		}
+ 		hash :=3D layer.BlobSum.Hex()
+ 		if err =3D checkLayer(hash); err !=3D nil {
+ 			return err
+diff --git a/vendor/github.com/containers/image/v5/ostree/ostree_src.go =
b/vendor/github.com/containers/image/v5/ostree/ostree_src.go
+index 9983acc0a..a9568c2d3 100644
+--- a/vendor/github.com/containers/image/v5/ostree/ostree_src.go
++++ b/vendor/github.com/containers/image/v5/ostree/ostree_src.go
+@@ -286,7 +286,9 @@ func (s *ostreeImageSource) readSingleFile(commit, p=
ath string) (io.ReadCloser,
+ // The Digest field in BlobInfo is guaranteed to be provided, Size may =
be -1 and MediaType may be optionally provided.
+ // May update BlobInfoCache, preferably after it knows for certain that=
 a blob truly exists at a specific location.
+ func (s *ostreeImageSource) GetBlob(ctx context.Context, info types.Blo=
bInfo, cache types.BlobInfoCache) (io.ReadCloser, int64, error) {
+-
++	if err :=3D info.Digest.Validate(); err !=3D nil { // digest.Digest.En=
coded() panics on failure, so validate explicitly.
++		return nil, -1, err
++	}
+ 	blob :=3D info.Digest.Hex()
+=20
+ 	// Ensure s.compressed is initialized.  It is build by LayerInfosForCo=
py.
+diff --git a/vendor/github.com/containers/image/v5/storage/storage_dest.=
go b/vendor/github.com/containers/image/v5/storage/storage_dest.go
+index 07e1d5e1f..0a5c36fb7 100644
+--- a/vendor/github.com/containers/image/v5/storage/storage_dest.go
++++ b/vendor/github.com/containers/image/v5/storage/storage_dest.go
+@@ -831,8 +831,12 @@ func (s *storageImageDestination) Commit(ctx contex=
t.Context, unparsedToplevel t
+ 		})
+ 	}
+ 	for instanceDigest, signatures :=3D range s.signatureses {
++		key, err :=3D signatureBigDataKey(instanceDigest)
++		if err !=3D nil {
++			return err
++		}
+ 		options.BigData =3D append(options.BigData, storage.ImageBigDataOptio=
n{
+-			Key:    signatureBigDataKey(instanceDigest),
++			Key:    key,
+ 			Data:   signatures,
+ 			Digest: digest.Canonical.FromBytes(signatures),
+ 		})
+diff --git a/vendor/github.com/containers/image/v5/storage/storage_image=
.go b/vendor/github.com/containers/image/v5/storage/storage_image.go
+index ac09f3dbb..b734c4129 100644
+--- a/vendor/github.com/containers/image/v5/storage/storage_image.go
++++ b/vendor/github.com/containers/image/v5/storage/storage_image.go
+@@ -32,8 +32,11 @@ func manifestBigDataKey(digest digest.Digest) string =
{
+=20
+ // signatureBigDataKey returns a key suitable for recording the signatu=
res associated with the manifest with the specified digest using storage.=
Store.ImageBigData and related functions.
+ // If a specific manifest digest is explicitly requested by the user, t=
he key returned by this function should be used preferably;
+-func signatureBigDataKey(digest digest.Digest) string {
+-	return "signature-" + digest.Encoded()
++func signatureBigDataKey(digest digest.Digest) (string, error) {
++	if err :=3D digest.Validate(); err !=3D nil { // digest.Digest.Encoded=
() panics on failure, so validate explicitly.
++		return "", err
++	}
++	return "signature-" + digest.Encoded(), nil
+ }
+=20
+ // Size() returns the previously-computed size of the image, with no er=
ror.
+diff --git a/vendor/github.com/containers/image/v5/storage/storage_src.g=
o b/vendor/github.com/containers/image/v5/storage/storage_src.go
+index f1ce0861e..29cce5635 100644
+--- a/vendor/github.com/containers/image/v5/storage/storage_src.go
++++ b/vendor/github.com/containers/image/v5/storage/storage_src.go
+@@ -329,7 +329,14 @@ func (s *storageImageSource) GetSignaturesWithForma=
t(ctx context.Context, instan
+ 	instance :=3D "default instance"
+ 	if instanceDigest !=3D nil {
+ 		signatureSizes =3D s.SignaturesSizes[*instanceDigest]
+-		key =3D signatureBigDataKey(*instanceDigest)
++		k, err :=3D signatureBigDataKey(*instanceDigest)
++		if err !=3D nil {
++			return nil, err
++		}
++		key =3D k
++		if err :=3D instanceDigest.Validate(); err !=3D nil { // digest.Diges=
t.Encoded() panics on failure, so validate explicitly.
++			return nil, err
++		}
+ 		instance =3D instanceDigest.Encoded()
+ 	}
+ 	if len(signatureSizes) > 0 {
+--=20
+2.40.0
+
diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0003.patch =
b/recipes-containers/buildah/buildah/CVE-2024-3727-0003.patch
new file mode 100644
index 00000000..fd911c4a
--- /dev/null
+++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0003.patch
@@ -0,0 +1,96 @@
+From 7b58b430ec8e64876d9b9dbd81989666293ffe87 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Miloslav=3D20Trma=3DC4=3D8D?=3D <mitr@redhat.com>
+Date: Thu, 18 Apr 2024 00:39:54 +0200
+Subject: [PATCH] Refactor the error handling path of saveStream
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Use defer() to remove the temporary file, instead
+of duplicating the call.
+
+Should not change behavior.
+
+Signed-off-by: Miloslav Trma=C4=8D <mitr@redhat.com>
+CVE: CVE-2024-3727
+Upstream-Status: Backport [https://github.com/containers/image/commit/7b=
58b430ec8e64876d9b9dbd81989666293ffe87]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+---
+ pkg/blobcache/dest.go | 51 ++++++++++++++++++++++++-------------------
+ 1 file changed, 28 insertions(+), 23 deletions(-)
+
+diff --git a/pkg/blobcache/dest.go b/pkg/blobcache/dest.go
+index 9bda0851..ac07cd3f 100644
+--- a/pkg/blobcache/dest.go
++++ b/pkg/blobcache/dest.go
+@@ -80,6 +80,17 @@ func (d *blobCacheDestination) IgnoresEmbeddedDockerR=
eference() bool {
+ // and this new file.
+ func (d *blobCacheDestination) saveStream(wg *sync.WaitGroup, decompres=
sReader io.ReadCloser, tempFile *os.File, compressedFilename string, comp=
ressedDigest digest.Digest, isConfig bool, alternateDigest *digest.Digest=
) {
+ 	defer wg.Done()
++
++	succeeded :=3D false
++	defer func() {
++		if !succeeded {
++			// Remove the temporary file.
++			if err :=3D os.Remove(tempFile.Name()); err !=3D nil {
++				logrus.Debugf("error cleaning up temporary file %q for decompressed=
 copy of blob %q: %v", tempFile.Name(), compressedDigest.String(), err)
++			}
++		}
++	}()
++
+ 	// Decompress from and digest the reading end of that pipe.
+ 	decompressed, err3 :=3D archive.DecompressStream(decompressReader)
+ 	digester :=3D digest.Canonical.Digester()
+@@ -96,31 +107,25 @@ func (d *blobCacheDestination) saveStream(wg *sync.=
WaitGroup, decompressReader i
+ 	decompressReader.Close()
+ 	decompressed.Close()
+ 	tempFile.Close()
++
+ 	// Determine the name that we should give to the uncompressed copy of =
the blob.
+ 	decompressedFilename :=3D d.reference.blobPath(digester.Digest(), isCo=
nfig)
+-	if err3 =3D=3D nil {
+-		// Rename the temporary file.
+-		if err3 =3D os.Rename(tempFile.Name(), decompressedFilename); err3 !=3D=
 nil {
+-			logrus.Debugf("error renaming new decompressed copy of blob %q into =
place at %q: %v", digester.Digest().String(), decompressedFilename, err3)
+-			// Remove the temporary file.
+-			if err3 =3D os.Remove(tempFile.Name()); err3 !=3D nil {
+-				logrus.Debugf("error cleaning up temporary file %q for decompressed=
 copy of blob %q: %v", tempFile.Name(), compressedDigest.String(), err3)
+-			}
+-		} else {
+-			*alternateDigest =3D digester.Digest()
+-			// Note the relationship between the two files.
+-			if err3 =3D ioutils.AtomicWriteFile(decompressedFilename+compressedN=
ote, []byte(compressedDigest.String()), 0600); err3 !=3D nil {
+-				logrus.Debugf("error noting that the compressed version of %q is %q=
: %v", digester.Digest().String(), compressedDigest.String(), err3)
+-			}
+-			if err3 =3D ioutils.AtomicWriteFile(compressedFilename+decompressedN=
ote, []byte(digester.Digest().String()), 0600); err3 !=3D nil {
+-				logrus.Debugf("error noting that the decompressed version of %q is =
%q: %v", compressedDigest.String(), digester.Digest().String(), err3)
+-			}
+-		}
+-	} else {
+-		// Remove the temporary file.
+-		if err3 =3D os.Remove(tempFile.Name()); err3 !=3D nil {
+-			logrus.Debugf("error cleaning up temporary file %q for decompressed =
copy of blob %q: %v", tempFile.Name(), compressedDigest.String(), err3)
+-		}
++	if err3 !=3D nil {
++		return
++	}
++	// Rename the temporary file.
++	if err :=3D os.Rename(tempFile.Name(), decompressedFilename); err !=3D=
 nil {
++		logrus.Debugf("error renaming new decompressed copy of blob %q into p=
lace at %q: %v", digester.Digest().String(), decompressedFilename, err)
++		return
++	}
++	succeeded =3D true
++	*alternateDigest =3D digester.Digest()
++	// Note the relationship between the two files.
++	if err :=3D ioutils.AtomicWriteFile(decompressedFilename+compressedNot=
e, []byte(compressedDigest.String()), 0600); err !=3D nil {
++		logrus.Debugf("error noting that the compressed version of %q is %q: =
%v", digester.Digest().String(), compressedDigest.String(), err)
++	}
++	if err :=3D ioutils.AtomicWriteFile(compressedFilename+decompressedNot=
e, []byte(digester.Digest().String()), 0600); err !=3D nil {
++		logrus.Debugf("error noting that the decompressed version of %q is %q=
: %v", compressedDigest.String(), digester.Digest().String(), err)
+ 	}
+ }
+=20
+--=20
+2.40.0
+
diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0004.patch =
b/recipes-containers/buildah/buildah/CVE-2024-3727-0004.patch
new file mode 100644
index 00000000..01b8a085
--- /dev/null
+++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0004.patch
@@ -0,0 +1,84 @@
+From 0860c58afa8561e31ab5bddbc75d193a7305622e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Miloslav=3D20Trma=3DC4=3D8D?=3D <mitr@redhat.com>
+Date: Thu, 18 Apr 2024 00:47:09 +0200
+Subject: [PATCH] Refactor the error handling further
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Use defer, a nested function, and early returns.
+
+Besides being a bit more directly related to what
+we want to achieve, this now does not call decompressed.Close()
+on a nil value if DecompressStream fails.
+
+Signed-off-by: Miloslav Trma=C4=8D <mitr@redhat.com>
+CVE: CVE-2024-3727
+Upstream-Status: Backport [https://github.com/containers/image/commit/08=
60c58afa8561e31ab5bddbc75d193a7305622e]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+---
+ pkg/blobcache/dest.go | 33 ++++++++++++++++++---------------
+ 1 file changed, 18 insertions(+), 15 deletions(-)
+
+diff --git a/pkg/blobcache/dest.go b/pkg/blobcache/dest.go
+index ac07cd3f..fde95974 100644
+--- a/pkg/blobcache/dest.go
++++ b/pkg/blobcache/dest.go
+@@ -80,6 +80,7 @@ func (d *blobCacheDestination) IgnoresEmbeddedDockerRe=
ference() bool {
+ // and this new file.
+ func (d *blobCacheDestination) saveStream(wg *sync.WaitGroup, decompres=
sReader io.ReadCloser, tempFile *os.File, compressedFilename string, comp=
ressedDigest digest.Digest, isConfig bool, alternateDigest *digest.Digest=
) {
+ 	defer wg.Done()
++	defer decompressReader.Close()
+=20
+ 	succeeded :=3D false
+ 	defer func() {
+@@ -91,28 +92,30 @@ func (d *blobCacheDestination) saveStream(wg *sync.W=
aitGroup, decompressReader i
+ 		}
+ 	}()
+=20
+-	// Decompress from and digest the reading end of that pipe.
+-	decompressed, err3 :=3D archive.DecompressStream(decompressReader)
+ 	digester :=3D digest.Canonical.Digester()
+-	if err3 =3D=3D nil {
++	if err :=3D func() error { // A scope for defer
++		defer tempFile.Close()
++
++		// Decompress from and digest the reading end of that pipe.
++		decompressed, err :=3D archive.DecompressStream(decompressReader)
++		if err !=3D nil {
++			// Drain the pipe to keep from stalling the PutBlob() thread.
++			if _, err2 :=3D io.Copy(io.Discard, decompressReader); err2 !=3D nil=
 {
++				logrus.Debugf("error draining the pipe: %v", err2)
++			}
++			return err
++		}
++		defer decompressed.Close()
+ 		// Read the decompressed data through the filter over the pipe, block=
ing until the
+ 		// writing end is closed.
+-		_, err3 =3D io.Copy(io.MultiWriter(tempFile, digester.Hash()), decomp=
ressed)
+-	} else {
+-		// Drain the pipe to keep from stalling the PutBlob() thread.
+-		if _, err :=3D io.Copy(io.Discard, decompressReader); err !=3D nil {
+-			logrus.Debugf("error draining the pipe: %v", err)
+-		}
++		_, err =3D io.Copy(io.MultiWriter(tempFile, digester.Hash()), decompr=
essed)
++		return err
++	}(); err !=3D nil {
++		return
+ 	}
+-	decompressReader.Close()
+-	decompressed.Close()
+-	tempFile.Close()
+=20
+ 	// Determine the name that we should give to the uncompressed copy of =
the blob.
+ 	decompressedFilename :=3D d.reference.blobPath(digester.Digest(), isCo=
nfig)
+-	if err3 !=3D nil {
+-		return
+-	}
+ 	// Rename the temporary file.
+ 	if err :=3D os.Rename(tempFile.Name(), decompressedFilename); err !=3D=
 nil {
+ 		logrus.Debugf("error renaming new decompressed copy of blob %q into p=
lace at %q: %v", digester.Digest().String(), decompressedFilename, err)
+--=20
+2.40.0
+
diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0005.patch =
b/recipes-containers/buildah/buildah/CVE-2024-3727-0005.patch
new file mode 100644
index 00000000..a3825303
--- /dev/null
+++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0005.patch
@@ -0,0 +1,417 @@
+From 086c7606314e6fa7638c36147a0e514c77a12008 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Miloslav=3D20Trma=3DC4=3D8D?=3D <mitr@redhat.com>
+Date: Thu, 18 Apr 2024 00:14:38 +0200
+Subject: [PATCH] Call .Validate() before digest.Digest.String() if neces=
sary
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+... to prevent unexpected behavior on invalid values.
+
+Signed-off-by: Miloslav Trma=C4=8D <mitr@redhat.com>
+CVE: CVE-2024-3727
+Upstream-Status: Backport [https://github.com/containers/image/commit/08=
6c7606314e6fa7638c36147a0e514c77a12008]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ docker/docker_client.go           | 20 +++++++++++++++++---
+ docker/docker_image_dest.go       | 11 ++++++++++-
+ docker/docker_image_src.go        |  8 ++++++++
+ docker/internal/tarfile/writer.go |  3 +++
+ openshift/openshift_src.go        |  3 +++
+ pkg/blobcache/blobcache.go        | 12 +++++++++---
+ pkg/blobcache/dest.go             | 15 ++++++++++++---
+ pkg/blobcache/src.go              | 16 ++++++++++++----
+ storage/storage_dest.go           | 12 ++++++++++--
+ storage/storage_image.go          |  7 +++++--
+ storage/storage_reference.go      | 10 ++++++++--
+ storage/storage_src.go            | 10 ++++++++--
+ 12 files changed, 105 insertions(+), 22 deletions(-)
+
+diff --git a/docker/docker_client.go b/docker/docker_client.go
+index 6ce8f700..d03f87a0 100644
+--- a/docker/docker_client.go
++++ b/docker/docker_client.go
+@@ -952,6 +952,8 @@ func (c *dockerClient) detectProperties(ctx context.=
Context) error {
+ 	return c.detectPropertiesError
+ }
+=20
++// fetchManifest fetches a manifest for (the repo of ref) + tagOrDigest.
++// The caller is responsible for ensuring tagOrDigest uses the expected=
 format.
+ func (c *dockerClient) fetchManifest(ctx context.Context, ref dockerRef=
erence, tagOrDigest string) ([]byte, string, error) {
+ 	path :=3D fmt.Sprintf(manifestPath, reference.Path(ref.ref), tagOrDige=
st)
+ 	headers :=3D map[string][]string{
+@@ -1034,6 +1036,9 @@ func (c *dockerClient) getBlob(ctx context.Context=
, ref dockerReference, info ty
+ 		}
+ 	}
+=20
++	if err :=3D info.Digest.Validate(); err !=3D nil { // Make sure info.D=
igest.String() does not contain any unexpected characters
++		return nil, 0, err
++	}
+ 	path :=3D fmt.Sprintf(blobsPath, reference.Path(ref.ref), info.Digest.=
String())
+ 	logrus.Debugf("Downloading %s", path)
+ 	res, err :=3D c.makeRequest(ctx, http.MethodGet, path, nil, nil, v2Aut=
h, nil)
+@@ -1097,7 +1102,10 @@ func isManifestUnknownError(err error) bool {
+ // digest in ref.
+ // It returns (nil, nil) if the manifest does not exist.
+ func (c *dockerClient) getSigstoreAttachmentManifest(ctx context.Contex=
t, ref dockerReference, digest digest.Digest) (*manifest.OCI1, error) {
+-	tag :=3D sigstoreAttachmentTag(digest)
++	tag, err :=3D sigstoreAttachmentTag(digest)
++	if err !=3D nil {
++		return nil, err
++	}
+ 	sigstoreRef, err :=3D reference.WithTag(reference.TrimNamed(ref.ref), =
tag)
+ 	if err !=3D nil {
+ 		return nil, err
+@@ -1130,6 +1138,9 @@ func (c *dockerClient) getSigstoreAttachmentManife=
st(ctx context.Context, ref do
+ // getExtensionsSignatures returns signatures from the X-Registry-Suppo=
rts-Signatures API extension,
+ // using the original data structures.
+ func (c *dockerClient) getExtensionsSignatures(ctx context.Context, ref=
 dockerReference, manifestDigest digest.Digest) (*extensionSignatureList,=
 error) {
++	if err :=3D manifestDigest.Validate(); err !=3D nil { // Make sure man=
ifestDigest.String() does not contain any unexpected characters
++		return nil, err
++	}
+ 	path :=3D fmt.Sprintf(extensionsSignaturePath, reference.Path(ref.ref)=
, manifestDigest)
+ 	res, err :=3D c.makeRequest(ctx, http.MethodGet, path, nil, nil, v2Aut=
h, nil)
+ 	if err !=3D nil {
+@@ -1153,8 +1164,11 @@ func (c *dockerClient) getExtensionsSignatures(ct=
x context.Context, ref dockerRe
+ }
+=20
+ // sigstoreAttachmentTag returns a sigstore attachment tag for the spec=
ified digest.
+-func sigstoreAttachmentTag(d digest.Digest) string {
+-	return strings.Replace(d.String(), ":", "-", 1) + ".sig"
++func sigstoreAttachmentTag(d digest.Digest) (string, error) {
++	if err :=3D d.Validate(); err !=3D nil { // Make sure d.String() doesn=
=E2=80=99t contain any unexpected characters
++		return "", err
++	}
++	return strings.Replace(d.String(), ":", "-", 1) + ".sig", nil
+ }
+=20
+ // Close removes resources associated with an initialized dockerClient,=
 if any.
+diff --git a/docker/docker_image_dest.go b/docker/docker_image_dest.go
+index 682954fd..0c0505a8 100644
+--- a/docker/docker_image_dest.go
++++ b/docker/docker_image_dest.go
+@@ -229,6 +229,9 @@ func (d *dockerImageDestination) PutBlobWithOptions(=
ctx context.Context, stream
+ // If the destination does not contain the blob, or it is unknown, blob=
Exists ordinarily returns (false, -1, nil);
+ // it returns a non-nil error only on an unexpected failure.
+ func (d *dockerImageDestination) blobExists(ctx context.Context, repo r=
eference.Named, digest digest.Digest, extraScope *authScope) (bool, int64=
, error) {
++	if err :=3D digest.Validate(); err !=3D nil { // Make sure digest.Stri=
ng() does not contain any unexpected characters
++		return false, -1, err
++	}
+ 	checkPath :=3D fmt.Sprintf(blobsPath, reference.Path(repo), digest.Str=
ing())
+ 	logrus.Debugf("Checking %s", checkPath)
+ 	res, err :=3D d.c.makeRequest(ctx, http.MethodHead, checkPath, nil, ni=
l, v2Auth, extraScope)
+@@ -466,6 +469,7 @@ func (d *dockerImageDestination) PutManifest(ctx con=
text.Context, m []byte, inst
+ 		// particular instance.
+ 		refTail =3D instanceDigest.String()
+ 		// Double-check that the manifest we've been given matches the digest=
 we've been given.
++		// This also validates the format of instanceDigest.
+ 		matches, err :=3D manifest.MatchesDigest(m, *instanceDigest)
+ 		if err !=3D nil {
+ 			return fmt.Errorf("digesting manifest in PutManifest: %w", err)
+@@ -780,8 +784,12 @@ func (d *dockerImageDestination) putSignaturesToSig=
storeAttachments(ctx context.
+ 	if err !=3D nil {
+ 		return err
+ 	}
++	attachmentTag, err :=3D sigstoreAttachmentTag(manifestDigest)
++	if err !=3D nil {
++		return err
++	}
+ 	logrus.Debugf("Uploading sigstore attachment manifest")
+-	return d.uploadManifest(ctx, manifestBlob, sigstoreAttachmentTag(manif=
estDigest))
++	return d.uploadManifest(ctx, manifestBlob, attachmentTag)
+ }
+=20
+ func layerMatchesSigstoreSignature(layer imgspecv1.Descriptor, mimeType=
 string,
+@@ -897,6 +905,7 @@ func (d *dockerImageDestination) putSignaturesToAPIE=
xtension(ctx context.Context
+ 			return err
+ 		}
+=20
++		// manifestDigest is known to be valid because it was not rejected by=
 getExtensionsSignatures above.
+ 		path :=3D fmt.Sprintf(extensionsSignaturePath, reference.Path(d.ref.r=
ef), manifestDigest.String())
+ 		res, err :=3D d.c.makeRequest(ctx, http.MethodPut, path, nil, bytes.N=
ewReader(body), v2Auth, nil)
+ 		if err !=3D nil {
+diff --git a/docker/docker_image_src.go b/docker/docker_image_src.go
+index b78b9b51..274cd6dd 100644
+--- a/docker/docker_image_src.go
++++ b/docker/docker_image_src.go
+@@ -194,6 +194,9 @@ func simplifyContentType(contentType string) string =
{
+ // this never happens if the primary manifest is not a manifest list (e=
.g. if the source never returns manifest lists).
+ func (s *dockerImageSource) GetManifest(ctx context.Context, instanceDi=
gest *digest.Digest) ([]byte, string, error) {
+ 	if instanceDigest !=3D nil {
++		if err :=3D instanceDigest.Validate(); err !=3D nil { // Make sure in=
stanceDigest.String() does not contain any unexpected characters
++			return nil, "", err
++		}
+ 		return s.fetchManifest(ctx, instanceDigest.String())
+ 	}
+ 	err :=3D s.ensureManifestIsLoaded(ctx)
+@@ -203,6 +206,8 @@ func (s *dockerImageSource) GetManifest(ctx context.=
Context, instanceDigest *dig
+ 	return s.cachedManifest, s.cachedManifestMIMEType, nil
+ }
+=20
++// fetchManifest fetches a manifest for tagOrDigest.
++// The caller is responsible for ensuring tagOrDigest uses the expected=
 format.
+ func (s *dockerImageSource) fetchManifest(ctx context.Context, tagOrDig=
est string) ([]byte, string, error) {
+ 	return s.c.fetchManifest(ctx, s.physicalRef, tagOrDigest)
+ }
+@@ -352,6 +357,9 @@ func (s *dockerImageSource) GetBlobAt(ctx context.Co=
ntext, info types.BlobInfo,
+ 		return nil, nil, fmt.Errorf("external URLs not supported with GetBlob=
At")
+ 	}
+=20
++	if err :=3D info.Digest.Validate(); err !=3D nil { // Make sure info.D=
igest.String() does not contain any unexpected characters
++		return nil, nil, err
++	}
+ 	path :=3D fmt.Sprintf(blobsPath, reference.Path(s.physicalRef.ref), in=
fo.Digest.String())
+ 	logrus.Debugf("Downloading %s", path)
+ 	res, err :=3D s.c.makeRequest(ctx, http.MethodGet, path, headers, nil,=
 v2Auth, nil)
+diff --git a/docker/internal/tarfile/writer.go b/docker/internal/tarfile=
/writer.go
+index 2d83254d..7f6bd0e6 100644
+--- a/docker/internal/tarfile/writer.go
++++ b/docker/internal/tarfile/writer.go
+@@ -142,6 +142,9 @@ func (w *Writer) writeLegacyMetadataLocked(layerDesc=
riptors []manifest.Schema2De
+ 		}
+=20
+ 		// This chainID value matches the computation in docker/docker/layer.=
CreateChainID =E2=80=A6
++		if err :=3D l.Digest.Validate(); err !=3D nil { // This should never =
fail on this code path, still: make sure the chainID computation is unamb=
iguous.
++			return err
++		}
+ 		if chainID =3D=3D "" {
+ 			chainID =3D l.Digest
+ 		} else {
+diff --git a/openshift/openshift_src.go b/openshift/openshift_src.go
+index 0ac0127e..62774afb 100644
+--- a/openshift/openshift_src.go
++++ b/openshift/openshift_src.go
+@@ -109,6 +109,9 @@ func (s *openshiftImageSource) GetSignaturesWithForm=
at(ctx context.Context, inst
+ 		}
+ 		imageStreamImageName =3D s.imageStreamImageName
+ 	} else {
++		if err :=3D instanceDigest.Validate(); err !=3D nil { // Make sure in=
stanceDigest.String() does not contain any unexpected characters
++			return nil, err
++		}
+ 		imageStreamImageName =3D instanceDigest.String()
+ 	}
+ 	image, err :=3D s.client.getImage(ctx, imageStreamImageName)
+diff --git a/pkg/blobcache/blobcache.go b/pkg/blobcache/blobcache.go
+index 2bbf4884..f4de6ceb 100644
+--- a/pkg/blobcache/blobcache.go
++++ b/pkg/blobcache/blobcache.go
+@@ -78,12 +78,15 @@ func (b *BlobCache) DeleteImage(ctx context.Context,=
 sys *types.SystemContext) e
+ }
+=20
+ // blobPath returns the path appropriate for storing a blob with digest.
+-func (b *BlobCache) blobPath(digest digest.Digest, isConfig bool) strin=
g {
++func (b *BlobCache) blobPath(digest digest.Digest, isConfig bool) (stri=
ng, error) {
++	if err :=3D digest.Validate(); err !=3D nil { // Make sure digest.Stri=
ng() does not contain any unexpected characters
++		return "", err
++	}
+ 	baseName :=3D digest.String()
+ 	if isConfig {
+ 		baseName +=3D ".config"
+ 	}
+-	return filepath.Join(b.directory, baseName)
++	return filepath.Join(b.directory, baseName), nil
+ }
+=20
+ // findBlob checks if we have a blob for info in cache (whether a confi=
g or not)
+@@ -95,7 +98,10 @@ func (b *BlobCache) findBlob(info types.BlobInfo) (st=
ring, int64, bool, error) {
+ 	}
+=20
+ 	for _, isConfig :=3D range []bool{false, true} {
+-		path :=3D b.blobPath(info.Digest, isConfig)
++		path, err :=3D b.blobPath(info.Digest, isConfig)
++		if err !=3D nil {
++			return "", -1, false, err
++		}
+ 		fileInfo, err :=3D os.Stat(path)
+ 		if err =3D=3D nil && (info.Size =3D=3D -1 || info.Size =3D=3D fileInf=
o.Size()) {
+ 			return path, fileInfo.Size(), isConfig, nil
+diff --git a/pkg/blobcache/dest.go b/pkg/blobcache/dest.go
+index fde95974..bae16758 100644
+--- a/pkg/blobcache/dest.go
++++ b/pkg/blobcache/dest.go
+@@ -115,7 +115,10 @@ func (d *blobCacheDestination) saveStream(wg *sync.=
WaitGroup, decompressReader i
+ 	}
+=20
+ 	// Determine the name that we should give to the uncompressed copy of =
the blob.
+-	decompressedFilename :=3D d.reference.blobPath(digester.Digest(), isCo=
nfig)
++	decompressedFilename, err :=3D d.reference.blobPath(digester.Digest(),=
 isConfig)
++	if err !=3D nil {
++		return
++	}
+ 	// Rename the temporary file.
+ 	if err :=3D os.Rename(tempFile.Name(), decompressedFilename); err !=3D=
 nil {
+ 		logrus.Debugf("error renaming new decompressed copy of blob %q into p=
lace at %q: %v", digester.Digest().String(), decompressedFilename, err)
+@@ -153,7 +156,10 @@ func (d *blobCacheDestination) PutBlobWithOptions(c=
tx context.Context, stream io
+ 	needToWait :=3D false
+ 	compression :=3D archive.Uncompressed
+ 	if inputInfo.Digest !=3D "" {
+-		filename :=3D d.reference.blobPath(inputInfo.Digest, options.IsConfig=
)
++		filename, err2 :=3D d.reference.blobPath(inputInfo.Digest, options.Is=
Config)
++		if err2 !=3D nil {
++			return private.UploadedBlob{}, err2
++		}
+ 		tempfile, err =3D os.CreateTemp(filepath.Dir(filename), filepath.Base=
(filename))
+ 		if err =3D=3D nil {
+ 			stream =3D io.TeeReader(stream, tempfile)
+@@ -282,7 +288,10 @@ func (d *blobCacheDestination) PutManifest(ctx cont=
ext.Context, manifestBytes []
+ 	if err !=3D nil {
+ 		logrus.Warnf("error digesting manifest %q: %v", string(manifestBytes)=
, err)
+ 	} else {
+-		filename :=3D d.reference.blobPath(manifestDigest, false)
++		filename, err :=3D d.reference.blobPath(manifestDigest, false)
++		if err !=3D nil {
++			return err
++		}
+ 		if err =3D ioutils.AtomicWriteFile(filename, manifestBytes, 0600); er=
r !=3D nil {
+ 			logrus.Warnf("error saving manifest as %q: %v", filename, err)
+ 		}
+diff --git a/pkg/blobcache/src.go b/pkg/blobcache/src.go
+index 2fe108cd..600d2fa7 100644
+--- a/pkg/blobcache/src.go
++++ b/pkg/blobcache/src.go
+@@ -56,7 +56,10 @@ func (s *blobCacheSource) Close() error {
+=20
+ func (s *blobCacheSource) GetManifest(ctx context.Context, instanceDige=
st *digest.Digest) ([]byte, string, error) {
+ 	if instanceDigest !=3D nil {
+-		filename :=3D s.reference.blobPath(*instanceDigest, false)
++		filename, err :=3D s.reference.blobPath(*instanceDigest, false)
++		if err !=3D nil {
++			return nil, "", err
++		}
+ 		manifestBytes, err :=3D os.ReadFile(filename)
+ 		if err =3D=3D nil {
+ 			s.cacheHits++
+@@ -136,8 +139,10 @@ func (s *blobCacheSource) LayerInfosForCopy(ctx con=
text.Context, instanceDigest
+ 		replacedInfos :=3D make([]types.BlobInfo, 0, len(infos))
+ 		for _, info :=3D range infos {
+ 			var replaceDigest []byte
+-			var err error
+-			blobFile :=3D s.reference.blobPath(info.Digest, false)
++			blobFile, err :=3D s.reference.blobPath(info.Digest, false)
++			if err !=3D nil {
++				return nil, err
++			}
+ 			var alternate string
+ 			switch s.reference.compress {
+ 			case types.Compress:
+@@ -148,7 +153,10 @@ func (s *blobCacheSource) LayerInfosForCopy(ctx con=
text.Context, instanceDigest
+ 				replaceDigest, err =3D os.ReadFile(alternate)
+ 			}
+ 			if err =3D=3D nil && digest.Digest(replaceDigest).Validate() =3D=3D =
nil {
+-				alternate =3D s.reference.blobPath(digest.Digest(replaceDigest), fa=
lse)
++				alternate, err =3D s.reference.blobPath(digest.Digest(replaceDigest=
), false)
++				if err !=3D nil {
++					return nil, err
++				}
+ 				fileInfo, err :=3D os.Stat(alternate)
+ 				if err =3D=3D nil {
+ 					switch info.MediaType {
+diff --git a/storage/storage_dest.go b/storage/storage_dest.go
+index b65be2e1..6b59be1f 100644
+--- a/storage/storage_dest.go
++++ b/storage/storage_dest.go
+@@ -803,8 +803,12 @@ func (s *storageImageDestination) Commit(ctx contex=
t.Context, unparsedToplevel t
+ 		if err !=3D nil {
+ 			return fmt.Errorf("digesting top-level manifest: %w", err)
+ 		}
++		key, err :=3D manifestBigDataKey(manifestDigest)
++		if err !=3D nil {
++			return err
++		}
+ 		options.BigData =3D append(options.BigData, storage.ImageBigDataOptio=
n{
+-			Key:    manifestBigDataKey(manifestDigest),
++			Key:    key,
+ 			Data:   toplevelManifest,
+ 			Digest: manifestDigest,
+ 		})
+@@ -812,8 +816,12 @@ func (s *storageImageDestination) Commit(ctx contex=
t.Context, unparsedToplevel t
+ 	// Set up to save the image's manifest.  Allow looking it up by digest=
 by using the key convention defined by the Store.
+ 	// Record the manifest twice: using a digest-specific key to allow ref=
erences to that specific digest instance,
+ 	// and using storage.ImageDigestBigDataKey for future users that don=E2=
=80=99t specify any digest and for compatibility with older readers.
++	key, err :=3D manifestBigDataKey(s.manifestDigest)
++	if err !=3D nil {
++		return err
++	}
+ 	options.BigData =3D append(options.BigData, storage.ImageBigDataOption=
{
+-		Key:    manifestBigDataKey(s.manifestDigest),
++		Key:    key,
+ 		Data:   s.manifest,
+ 		Digest: s.manifestDigest,
+ 	})
+diff --git a/storage/storage_image.go b/storage/storage_image.go
+index b734c412..ba25a0cb 100644
+--- a/storage/storage_image.go
++++ b/storage/storage_image.go
+@@ -26,8 +26,11 @@ type storageImageCloser struct {
+ // manifestBigDataKey returns a key suitable for recording a manifest w=
ith the specified digest using storage.Store.ImageBigData and related fun=
ctions.
+ // If a specific manifest digest is explicitly requested by the user, t=
he key returned by this function should be used preferably;
+ // for compatibility, if a manifest is not available under this key, ch=
eck also storage.ImageDigestBigDataKey
+-func manifestBigDataKey(digest digest.Digest) string {
+-	return storage.ImageDigestManifestBigDataNamePrefix + "-" + digest.Str=
ing()
++func manifestBigDataKey(digest digest.Digest) (string, error) {
++	if err :=3D digest.Validate(); err !=3D nil { // Make sure info.Digest=
.String() uses the expected format and does not collide with other BigDat=
a keys.
++		return "", err
++	}
++	return storage.ImageDigestManifestBigDataNamePrefix + "-" + digest.Str=
ing(), nil
+ }
+=20
+ // signatureBigDataKey returns a key suitable for recording the signatu=
res associated with the manifest with the specified digest using storage.=
Store.ImageBigData and related functions.
+diff --git a/storage/storage_reference.go b/storage/storage_reference.go
+index a55e3405..6b7565fd 100644
+--- a/storage/storage_reference.go
++++ b/storage/storage_reference.go
+@@ -73,7 +73,10 @@ func multiArchImageMatchesSystemContext(store storage=
.Store, img *storage.Image,
+ 	// We don't need to care about storage.ImageDigestBigDataKey because
+ 	// manifests lists are only stored into storage by c/image versions
+ 	// that know about manifestBigDataKey, and only using that key.
+-	key :=3D manifestBigDataKey(manifestDigest)
++	key, err :=3D manifestBigDataKey(manifestDigest)
++	if err !=3D nil {
++		return false // This should never happen, manifestDigest comes from a=
 reference.Digested, and that validates the format.
++	}
+ 	manifestBytes, err :=3D store.ImageBigData(img.ID, key)
+ 	if err !=3D nil {
+ 		return false
+@@ -95,7 +98,10 @@ func multiArchImageMatchesSystemContext(store storage=
.Store, img *storage.Image,
+ 	if err !=3D nil {
+ 		return false
+ 	}
+-	key =3D manifestBigDataKey(chosenInstance)
++	key, err =3D manifestBigDataKey(chosenInstance)
++	if err !=3D nil {
++		return false
++	}
+ 	_, err =3D store.ImageBigData(img.ID, key)
+ 	return err =3D=3D nil // true if img.ID is based on chosenInstance.
+ }
+diff --git a/storage/storage_src.go b/storage/storage_src.go
+index 29cce563..7e4b69f2 100644
+--- a/storage/storage_src.go
++++ b/storage/storage_src.go
+@@ -202,7 +202,10 @@ func (s *storageImageSource) getBlobAndLayerID(dige=
st digest.Digest, layers []st
+ // GetManifest() reads the image's manifest.
+ func (s *storageImageSource) GetManifest(ctx context.Context, instanceD=
igest *digest.Digest) (manifestBlob []byte, mimeType string, err error) {
+ 	if instanceDigest !=3D nil {
+-		key :=3D manifestBigDataKey(*instanceDigest)
++		key, err :=3D manifestBigDataKey(*instanceDigest)
++		if err !=3D nil {
++			return nil, "", err
++		}
+ 		blob, err :=3D s.imageRef.transport.store.ImageBigData(s.image.ID, ke=
y)
+ 		if err !=3D nil {
+ 			return nil, "", fmt.Errorf("reading manifest for image instance %q: =
%w", *instanceDigest, err)
+@@ -214,7 +217,10 @@ func (s *storageImageSource) GetManifest(ctx contex=
t.Context, instanceDigest *di
+ 		// Prefer the manifest corresponding to the user-specified digest, if=
 available.
+ 		if s.imageRef.named !=3D nil {
+ 			if digested, ok :=3D s.imageRef.named.(reference.Digested); ok {
+-				key :=3D manifestBigDataKey(digested.Digest())
++				key, err :=3D manifestBigDataKey(digested.Digest())
++				if err !=3D nil {
++					return nil, "", err
++				}
+ 				blob, err :=3D s.imageRef.transport.store.ImageBigData(s.image.ID, =
key)
+ 				if err !=3D nil && !os.IsNotExist(err) { // os.IsNotExist is true i=
f the image exists but there is no data corresponding to key
+ 					return nil, "", err
+--=20
+2.40.0
+
diff --git a/recipes-containers/buildah/buildah/CVE-2024-3727-0006.patch =
b/recipes-containers/buildah/buildah/CVE-2024-3727-0006.patch
new file mode 100644
index 00000000..261005a9
--- /dev/null
+++ b/recipes-containers/buildah/buildah/CVE-2024-3727-0006.patch
@@ -0,0 +1,37 @@
+From 6e25805f4bce855c85bb944b7dd1c0246dd02ad0 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Miloslav=3D20Trma=3DC4=3D8D?=3D <mitr@redhat.com>
+Date: Thu, 18 Apr 2024 19:10:39 +0200
+Subject: [PATCH] Validate the tags returned by a registry
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Miloslav Trma=C4=8D <mitr@redhat.com>
+CVE: CVE-2024-3727
+Upstream-Status: Backport [https://github.com/containers/image/commit/6e=
25805f4bce855c85bb944b7dd1c0246dd02ad0]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ docker/docker_image.go | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/docker/docker_image.go b/docker/docker_image.go
+index 93160480..4c80bb2b 100644
+--- a/docker/docker_image.go
++++ b/docker/docker_image.go
+@@ -88,7 +88,12 @@ func GetRepositoryTags(ctx context.Context, sys *type=
s.SystemContext, ref types.
+ 		if err =3D json.NewDecoder(res.Body).Decode(&tagsHolder); err !=3D ni=
l {
+ 			return nil, err
+ 		}
+-		tags =3D append(tags, tagsHolder.Tags...)
++		for _, tag :=3D range tagsHolder.Tags {
++			if _, err :=3D reference.WithTag(dr.ref, tag); err !=3D nil { // Ens=
ure the tag does not contain unexpected values
++				return nil, fmt.Errorf("registry returned invalid tag %q: %w", tag,=
 err)
++			}
++			tags =3D append(tags, tag)
++		}
+=20
+ 		link :=3D res.Header.Get("Link")
+ 		if link =3D=3D "" {
+--=20
+2.40.0
+
diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containe=
rs/buildah/buildah_git.bb
index 90ffc238..ff3d44ea 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -33,6 +33,12 @@ SRCREV_storage =3D "246ba3062e8b551026aef2708eee747014=
ce5c52"
=20
 SRC_URI =3D " \
     git://github.com/containers/buildah;branch=3Drelease-1.34;name=3Dbui=
ldah;protocol=3Dhttps \
+    file://CVE-2024-3727-0001.patch;patchdir=3Dsrc/github.com/containers=
/buildah/vendor/github.com/containers/image/v5 \
+    file://CVE-2024-3727-0002.patch;patchdir=3Dsrc/github.com/containers=
/buildah \
+    file://CVE-2024-3727-0003.patch;patchdir=3Dsrc/github.com/containers=
/buildah/vendor/github.com/containers/image/v5 \
+    file://CVE-2024-3727-0004.patch;patchdir=3Dsrc/github.com/containers=
/buildah/vendor/github.com/containers/image/v5 \
+    file://CVE-2024-3727-0005.patch;patchdir=3Dsrc/github.com/containers=
/buildah/vendor/github.com/containers/image/v5 \
+    file://CVE-2024-3727-0006.patch;patchdir=3Dsrc/github.com/containers=
/buildah/vendor/github.com/containers/image/v5 \
     "
=20
 DEPENDS =3D "libdevmapper btrfs-tools gpgme"
--=20
2.40.0


