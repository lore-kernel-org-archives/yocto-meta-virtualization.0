Return-Path: <zongchun.yu@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26DBFE00D3D; Mon, 18 Apr 2016 19:26:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.112.89 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0089.outbound.protection.outlook.com [157.56.112.89])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57D46E0092C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 19:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=eqI7zI9dDYL7G8/534FFRSaLc6aX70gcncgjkDf/uiA=;
	b=cN9nLA/M4/ikHdUSa/iV8KP5jC4U67O7iG9WhxYgMtVqZn0Tca0WTgvJXNdX/9vgZbX404dtHt5ZlfFRUkL9FP/SAwf0bQMd/2CvASQrrURHCX0Yh64SdHxBS/Xq4lZSBAtxxzcgw3I/nEwoMmNLJlVexV/m4p115UjmUPHFb1k=
Received: from HE1PR04MB2170.eurprd04.prod.outlook.com (10.166.76.18) by
	HE1PR04MB2172.eurprd04.prod.outlook.com (10.166.76.20) with Microsoft
	SMTP Server (TLS) id 15.1.466.19; Tue, 19 Apr 2016 02:26:06 +0000
Received: from HE1PR04MB2170.eurprd04.prod.outlook.com ([10.166.76.18]) by
	HE1PR04MB2170.eurprd04.prod.outlook.com ([10.166.76.18]) with mapi id
	15.01.0466.022; Tue, 19 Apr 2016 02:26:06 +0000
From: Zongchun Yu <zongchun.yu@nxp.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization][PATCH][v2] docker: uprev to 1.9.0
Thread-Index: AQHRlJZRNOS7qsofpUmtcKHeNnkzsp+Qm21Q
Date: Tue, 19 Apr 2016 02:26:05 +0000
Message-ID: <HE1PR04MB2170BADC77C7DC4781349639FD6C0@HE1PR04MB2170.eurprd04.prod.outlook.com>
References: <1460450138-16240-1-git-send-email-zongchun.yu@nxp.com>
In-Reply-To: <1460450138-16240-1-git-send-email-zongchun.yu@nxp.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [123.151.195.51]
x-ms-office365-filtering-correlation-id: d41e44c0-92cb-438c-08e2-08d367f9f61a
x-microsoft-exchange-diagnostics: 1; HE1PR04MB2172;
	5:CVohFB44fgtXrNPXJHrG9gyy/YITr3rN5v42kzya+AZ9QJwssp6VMKEQiSf8QJpW7GfUEeqs9vtpNsf2luGhf5ug4oORMLwDm5rOGCmIAcbWmjVL+km5X2QTpdFLRXoisnJQO6kQLBk7udkOMgIs/gf4+nnXeo12wm+6GBdnsTdn0jQoFIf9KBsU7v4165CA;
	24:VD6wkRzPSvMcDVLGK7nk3SdWW8LeYtjHftHzeDD+As721KdEau7+64zTPxbDKfP0BN7H+ERx/EAW2O5CFCqvKBL5GIPIj+QGCnH+5/1I9lM=;
	7:vXsmWvjJYEUT1CeHbKYnTWv3x5+66gkYlVE5P/IYIWSQABdWpsImFNOwveOq/hszDW7bcrBUAIh05ksASbBuWP1nRUztxvQ1zVAkz8WbENUhCET8Bir4AK8/8kG4KndLWKj6OgO1Co0q4s0xcm4Y78HfeRCArks4TUTQmYmTSzR8AuUSkaxTLLwcB/hQrMclb0qiXJ6HfZ9UG5AKN95KOhUtc3hM3gM32QW+/iciWrU=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR04MB2172;
x-microsoft-antispam-prvs: <HE1PR04MB2172D9A1A11651EE94C64966FD6C0@HE1PR04MB2172.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(209352067349851);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(9101521026)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:HE1PR04MB2172; BCL:0; PCL:0; RULEID:; SRVR:HE1PR04MB2172; 
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(13464003)(377454003)(2950100001)(10400500002)(77096005)(15395725005)(15975445007)(2900100001)(5008740100001)(122556002)(76576001)(15198665003)(110136002)(5002640100001)(586003)(6116002)(102836003)(3846002)(2501003)(86362001)(76176999)(189998001)(87936001)(575784001)(5890100001)(5004730100002)(66066001)(50986999)(54356999)(106116001)(10750500005)(2906002)(551934003)(74316001)(1220700001)(1096002)(4326007)(5003600100002)(33656002)(92566002)(9686002)(2351001)(3280700002)(19580405001)(19580395003)(81166005)(3660700001)(5640700001)(579004)(559001)(10090945008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR04MB2172;
	H:HE1PR04MB2170.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2016 02:26:05.9978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2172
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH][v2] docker: uprev to 1.9.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2016 02:26:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce.

May I know if you have comments about this v2 patch? If not. Can you help t=
o apply the patch?

Thanks.

Best Regards
Zongchun
-----Original Message-----
From: zongchun.yu@nxp.com [mailto:zongchun.yu@nxp.com]=20
Sent: Tuesday, April 12, 2016 4:36 PM
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com; Zongchun Yu
Subject: [meta-virtualization][PATCH][v2] docker: uprev to 1.9.0

From: Zongchun Yu <zongchun.yu@nxp.com>

Uprev to 1.9.0.
Enable build support for arm64.
The libcontainer is removed from the source in the new version. drop the ns=
init install lines.

Signed-off-by: Zongchun Yu <zongchun.yu@nxp.com>
---
 recipes-containers/docker/docker_git.bb            |   38 +-
 .../docker/files/Bump-bolt-to-v1.1.0.patch         | 1828 ++++++++++++++++=
++++
 .../docker/files/disable_sha1sum_startup.patch     |   21 +-
 3 files changed, 1855 insertions(+), 32 deletions(-)
 create mode 100644 recipes-containers/docker/files/Bump-bolt-to-v1.1.0.pat=
ch

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/d=
ocker/docker_git.bb
index 2672b22..19fdef0 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -18,23 +18,23 @@ DESCRIPTION =3D "Linux container runtime \
  subtle and/or glaring issues. \
  "
=20
-SRCREV =3D "7c8fca2ddb58c8d2c4fb4df31c242886df7dd257"
-SRCBRANCH =3D "v1.6.2"
+SRCREV =3D "76d6bc9a9f1690e16f3721ba165364688b626de2"
 SRC_URI =3D "\
-	git://github.com/docker/docker.git;branch=3D${SRCBRANCH};nobranch=3D1 \
+	git://github.com/docker/docker.git;nobranch=3D1 \
 	file://docker.service \
 	file://docker.init \
 	file://hi.Dockerfile \
 	file://disable_sha1sum_startup.patch \
+	file://Bump-bolt-to-v1.1.0.patch \
 	"
=20
 # Apache-2.0 for docker
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1cc0497778922bfd6cb48721deb80dc=
7"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcc2221abf0b96ea39dd68141b70f793=
7"
=20
 S =3D "${WORKDIR}/git"
=20
-DOCKER_VERSION =3D "1.6.2"
+DOCKER_VERSION =3D "1.9.0"
 PV =3D "${DOCKER_VERSION}+git${SRCREV}"
=20
 DEPENDS =3D "go-cross \
@@ -62,17 +62,17 @@ RRECOMMENDS_${PN} =3D "lxc docker-registry rt-tests"
 RRECOMMENDS_${PN} +=3D " kernel-module-dm-thin-pool kernel-module-nf-nat"
 DOCKER_PKG=3D"github.com/docker/docker"
=20
-do_configure() {
-}
+do_configure[noexec] =3D "1"
=20
 do_compile() {
-	export PATH=3D${STAGING_BINDIR_NATIVE}/${HOST_SYS}/go-1.3:$PATH
-
 	export GOARCH=3D"${TARGET_ARCH}"
-	# supported amd64, 386, arm
+	# supported amd64, 386, arm arm64
 	if [ "${TARGET_ARCH}" =3D "x86_64" ]; then
 		export GOARCH=3D"amd64"
 	fi
+	if [ "${TARGET_ARCH}" =3D "aarch64" ]; then
+		export GOARCH=3D"arm64"
+	fi
=20
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
@@ -84,21 +84,19 @@ do_compile() {
 	export GOPATH=3D"${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}=
/local/go"
 	cd -
=20
-	export CGO_ENABLED=3D"1"
-
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export CGO_CFLAGS=3D"${BUILDSDK_CFLAGS}"
-	export CGO_LDFLAGS=3D"${BUILDSDK_LDFLAGS}"
+	export CGO_ENABLED=3D"1"
+	export CGO_CFLAGS=3D"${BUILDSDK_CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}=
"
+	export CGO_LDFLAGS=3D"${BUILDSDK_LDFLAGS} --sysroot=3D${STAGING_DIR_TARGE=
T}"
+	# in order to exclude devicemapper and btrfs - https://github.com/docker/=
docker/issues/14056
+	export DOCKER_BUILDTAGS=3D'exclude_graphdriver_btrfs exclude_graphdriver_=
devicemapper'
=20
 	# this is the unsupported built structure
 	# that doesn't rely on an existing docker
 	# to build this:
 	DOCKER_GITCOMMIT=3D"${SRCREV}" \
 	  ./hack/make.sh dynbinary
-
-	# make nsinit from libcontainer
-	go install github.com/docker/libcontainer/nsinit/
 }
=20
 inherit systemd update-rc.d
@@ -127,12 +125,6 @@ do_install() {
             install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.=
d/docker.init
 	fi
=20
-	if [ -d ${S}/vendor/bin/linux_* ]; then
-		cp ${S}/vendor/bin/linux_*/* ${D}/${bindir}
-	else
-		cp ${S}/vendor/bin/* ${D}/${bindir}
-	fi
-
 	mkdir -p ${D}/usr/share/docker/
 	cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
 }
diff --git a/recipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch b/re=
cipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch
new file mode 100644
index 0000000..ca4ad81
--- /dev/null
+++ b/recipes-containers/docker/files/Bump-bolt-to-v1.1.0.patch
@@ -0,0 +1,1828 @@
+From a41917c2c88bd7f694d141ac67f4a194aaa16fa1 Mon Sep 17 00:00:00 2001
+From: Qiang Huang <h.huangqiang@huawei.com>
+Date: Wed, 28 Oct 2015 08:49:45 +0800
+Subject: [PATCH] Bump bolt to v1.1.0
+
+It adds ARM64, ppc64le, s390x, solaris support, and a bunch of
+bugfixs.
+
+Signed-off-by: Qiang Huang <h.huangqiang@huawei.com>
+---
+ hack/vendor.sh                                     |   2 +-
+ vendor/src/github.com/boltdb/bolt/.gitignore       |   1 +
+ vendor/src/github.com/boltdb/bolt/README.md        | 250 ++++++++++++++++=
+++--
+ vendor/src/github.com/boltdb/bolt/batch.go         | 138 ++++++++++++
+ vendor/src/github.com/boltdb/bolt/bolt_386.go      |   5 +-
+ vendor/src/github.com/boltdb/bolt/bolt_amd64.go    |   3 +
+ vendor/src/github.com/boltdb/bolt/bolt_arm.go      |   5 +-
+ vendor/src/github.com/boltdb/bolt/bolt_arm64.go    |   9 +
+ vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go  |   9 +
+ vendor/src/github.com/boltdb/bolt/bolt_s390x.go    |   9 +
+ vendor/src/github.com/boltdb/bolt/bolt_unix.go     |  37 ++-
+ .../github.com/boltdb/bolt/bolt_unix_solaris.go    | 101 +++++++++
+ vendor/src/github.com/boltdb/bolt/bolt_windows.go  |  10 +-
+ vendor/src/github.com/boltdb/bolt/bucket.go        |  29 ++-
+ vendor/src/github.com/boltdb/bolt/cursor.go        |  12 +-
+ vendor/src/github.com/boltdb/bolt/db.go            | 195 ++++++++++++----
+ vendor/src/github.com/boltdb/bolt/errors.go        |   4 +
+ vendor/src/github.com/boltdb/bolt/freelist.go      |  28 ++-
+ vendor/src/github.com/boltdb/bolt/node.go          |  36 ++-
+ vendor/src/github.com/boltdb/bolt/page.go          |  45 +++-
+ vendor/src/github.com/boltdb/bolt/tx.go            |  80 +++++--
+ 21 files changed, 886 insertions(+), 122 deletions(-)
+ create mode 100644 vendor/src/github.com/boltdb/bolt/batch.go
+ create mode 100644 vendor/src/github.com/boltdb/bolt/bolt_arm64.go
+ create mode 100644 vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go
+ create mode 100644 vendor/src/github.com/boltdb/bolt/bolt_s390x.go
+ create mode 100644 vendor/src/github.com/boltdb/bolt/bolt_unix_solaris.go
+
+diff --git a/hack/vendor.sh b/hack/vendor.sh
+index d872d4a..c28e677 100755
+--- a/hack/vendor.sh
++++ b/hack/vendor.sh
+@@ -36,7 +36,7 @@ clone git github.com/coreos/etcd v2.2.0
+ fix_rewritten_imports github.com/coreos/etcd
+ clone git github.com/ugorji/go 5abd4e96a45c386928ed2ca2a7ef63e2533e18ec
+ clone git github.com/hashicorp/consul v0.5.2
+-clone git github.com/boltdb/bolt v1.0
++clone git github.com/boltdb/bolt v1.1.0
+=20
+ # get graph and distribution packages
+ clone git github.com/docker/distribution 20c4b7a1805a52753dfd593ee1cc3555=
8722a0ce # docker/1.9 branch
+diff --git a/vendor/src/github.com/boltdb/bolt/.gitignore b/vendor/src/git=
hub.com/boltdb/bolt/.gitignore
+index b2bb382..c7bd2b7 100644
+--- a/vendor/src/github.com/boltdb/bolt/.gitignore
++++ b/vendor/src/github.com/boltdb/bolt/.gitignore
+@@ -1,3 +1,4 @@
+ *.prof
+ *.test
++*.swp
+ /bin/
+diff --git a/vendor/src/github.com/boltdb/bolt/README.md b/vendor/src/gith=
ub.com/boltdb/bolt/README.md
+index 727e977..0a33ebc 100644
+--- a/vendor/src/github.com/boltdb/bolt/README.md
++++ b/vendor/src/github.com/boltdb/bolt/README.md
+@@ -16,7 +16,7 @@ and setting values. That's it.
+=20
+ ## Project Status
+=20
+-Bolt is stable and the API is fixed. Full unit test coverage and randomiz=
ed=20
++Bolt is stable and the API is fixed. Full unit test coverage and randomiz=
ed
+ black box testing are used to ensure database consistency and thread safe=
ty.
+ Bolt is currently in high-load production environments serving databases =
as
+ large as 1TB. Many companies such as Shopify and Heroku use Bolt-backed
+@@ -87,6 +87,11 @@ are not thread safe. To work with data in multiple goro=
utines you must start
+ a transaction for each one or use locking to ensure only one goroutine ac=
cesses
+ a transaction at a time. Creating transaction from the `DB` is thread saf=
e.
+=20
++Read-only transactions and read-write transactions should not depend on o=
ne
++another and generally shouldn't be opened simultaneously in the same goro=
utine.
++This can cause a deadlock as the read-write transaction needs to periodic=
ally
++re-map the data file but it cannot do so while a read-only transaction is=
 open.
++
+=20
+ #### Read-write transactions
+=20
+@@ -120,12 +125,88 @@ err :=3D db.View(func(tx *bolt.Tx) error {
+ })
+ ```
+=20
+-You also get a consistent view of the database within this closure, howev=
er,=20
++You also get a consistent view of the database within this closure, howev=
er,
+ no mutating operations are allowed within a read-only transaction. You ca=
n only
+ retrieve buckets, retrieve values, and copy the database within a read-on=
ly
+ transaction.
+=20
+=20
++#### Batch read-write transactions
++
++Each `DB.Update()` waits for disk to commit the writes. This overhead
++can be minimized by combining multiple updates with the `DB.Batch()`
++function:
++
++```go
++err :=3D db.Batch(func(tx *bolt.Tx) error {
++	...
++	return nil
++})
++```
++
++Concurrent Batch calls are opportunistically combined into larger
++transactions. Batch is only useful when there are multiple goroutines
++calling it.
++
++The trade-off is that `Batch` can call the given
++function multiple times, if parts of the transaction fail. The
++function must be idempotent and side effects must take effect only
++after a successful return from `DB.Batch()`.
++
++For example: don't display messages from inside the function, instead
++set variables in the enclosing scope:
++
++```go
++var id uint64
++err :=3D db.Batch(func(tx *bolt.Tx) error {
++	// Find last key in bucket, decode as bigendian uint64, increment
++	// by one, encode back to []byte, and add new key.
++	...
++	id =3D newValue
++	return nil
++})
++if err !=3D nil {
++	return ...
++}
++fmt.Println("Allocated ID %d", id)
++```
++
++
++#### Managing transactions manually
++
++The `DB.View()` and `DB.Update()` functions are wrappers around the `DB.B=
egin()`
++function. These helper functions will start the transaction, execute a fu=
nction,
++and then safely close your transaction if an error is returned. This is t=
he
++recommended way to use Bolt transactions.
++
++However, sometimes you may want to manually start and end your transactio=
ns.
++You can use the `Tx.Begin()` function directly but _please_ be sure to cl=
ose the
++transaction.
++
++```go
++// Start a writable transaction.
++tx, err :=3D db.Begin(true)
++if err !=3D nil {
++    return err
++}
++defer tx.Rollback()
++
++// Use the transaction...
++_, err :=3D tx.CreateBucket([]byte("MyBucket"))
++if err !=3D nil {
++    return err
++}
++
++// Commit the transaction and check for error.
++if err :=3D tx.Commit(); err !=3D nil {
++    return err
++}
++```
++
++The first argument to `DB.Begin()` is a boolean stating if the transactio=
n
++should be writable.
++
++
+ ### Using buckets
+=20
+ Buckets are collections of key/value pairs within the database. All keys =
in a
+@@ -175,13 +256,61 @@ db.View(func(tx *bolt.Tx) error {
+ ```
+=20
+ The `Get()` function does not return an error because its operation is
+-guarenteed to work (unless there is some kind of system failure). If the =
key
++guaranteed to work (unless there is some kind of system failure). If the =
key
+ exists then it will return its byte slice value. If it doesn't exist then=
 it
+ will return `nil`. It's important to note that you can have a zero-length=
 value
+ set to a key which is different than the key not existing.
+=20
+ Use the `Bucket.Delete()` function to delete a key from the bucket.
+=20
++Please note that values returned from `Get()` are only valid while the
++transaction is open. If you need to use a value outside of the transactio=
n
++then you must use `copy()` to copy it to another byte slice.
++
++
++### Autoincrementing integer for the bucket
++By using the NextSequence() function, you can let Bolt determine a sequen=
ce
++which can be used as the unique identifier for your key/value pairs. See =
the
++example below.
++
++```go
++// CreateUser saves u to the store. The new user ID is set on u once the =
data is persisted.
++func (s *Store) CreateUser(u *User) error {
++    return s.db.Update(func(tx *bolt.Tx) error {
++        // Retrieve the users bucket.
++        // This should be created when the DB is first opened.
++        b :=3D tx.Bucket([]byte("users"))
++
++        // Generate ID for the user.
++        // This returns an error only if the Tx is closed or not writeabl=
e.
++        // That can't happen in an Update() call so I ignore the error ch=
eck.
++        id, _ =3D b.NextSequence()
++        u.ID =3D int(id)
++
++        // Marshal user data into bytes.
++        buf, err :=3D json.Marshal(u)
++        if err !=3D nil {
++            return err
++        }
++
++        // Persist bytes to users bucket.
++        return b.Put(itob(u.ID), buf)
++    })
++}
++
++// itob returns an 8-byte big endian representation of v.
++func itob(v int) []byte {
++    b :=3D make([]byte, 8)
++    binary.BigEndian.PutUint64(b, uint64(v))
++    return b
++}
++
++type User struct {
++    ID int
++    ...
++}
++
++```
+=20
+ ### Iterating over keys
+=20
+@@ -254,7 +383,7 @@ db.View(func(tx *bolt.Tx) error {
+ 	max :=3D []byte("2000-01-01T00:00:00Z")
+=20
+ 	// Iterate over the 90's.
+-	for k, v :=3D c.Seek(min); k !=3D nil && bytes.Compare(k, max) !=3D -1; =
k, v =3D c.Next() {
++	for k, v :=3D c.Seek(min); k !=3D nil && bytes.Compare(k, max) <=3D 0; k=
, v =3D c.Next() {
+ 		fmt.Printf("%s: %s\n", k, v)
+ 	}
+=20
+@@ -294,7 +423,7 @@ func (*Bucket) DeleteBucket(key []byte) error
+=20
+ ### Database backups
+=20
+-Bolt is a single file so it's easy to backup. You can use the `Tx.Copy()`
++Bolt is a single file so it's easy to backup. You can use the `Tx.WriteTo=
()`
+ function to write a consistent view of the database to a writer. If you c=
all
+ this from a read-only transaction, it will perform a hot backup and not b=
lock
+ your other database reads and writes. It will also use `O_DIRECT` when av=
ailable
+@@ -305,11 +434,12 @@ do database backups:
+=20
+ ```go
+ func BackupHandleFunc(w http.ResponseWriter, req *http.Request) {
+-	err :=3D db.View(func(tx bolt.Tx) error {
++	err :=3D db.View(func(tx *bolt.Tx) error {
+ 		w.Header().Set("Content-Type", "application/octet-stream")
+ 		w.Header().Set("Content-Disposition", `attachment; filename=3D"my.db"`)
+ 		w.Header().Set("Content-Length", strconv.Itoa(int(tx.Size())))
+-		return tx.Copy(w)
++		_, err :=3D tx.WriteTo(w)
++		return err
+ 	})
+ 	if err !=3D nil {
+ 		http.Error(w, err.Error(), http.StatusInternalServerError)
+@@ -351,14 +481,13 @@ go func() {
+ 		// Grab the current stats and diff them.
+ 		stats :=3D db.Stats()
+ 		diff :=3D stats.Sub(&prev)
+-	=09
++
+ 		// Encode stats to JSON and print to STDERR.
+ 		json.NewEncoder(os.Stderr).Encode(diff)
+=20
+ 		// Save stats for the next loop.
+ 		prev =3D stats
+ 	}
+-}
+ }()
+ ```
+=20
+@@ -366,25 +495,83 @@ It's also useful to pipe these stats to a service su=
ch as statsd for monitoring
+ or to provide an HTTP endpoint that will perform a fixed-length sample.
+=20
+=20
++### Read-Only Mode
++
++Sometimes it is useful to create a shared, read-only Bolt database. To th=
is,
++set the `Options.ReadOnly` flag when opening your database. Read-only mod=
e
++uses a shared lock to allow multiple processes to read from the database =
but
++it will block any processes from opening the database in read-write mode.
++
++```go
++db, err :=3D bolt.Open("my.db", 0666, &bolt.Options{ReadOnly: true})
++if err !=3D nil {
++	log.Fatal(err)
++}
++```
++
++
+ ## Resources
+=20
+ For more information on getting started with Bolt, check out the followin=
g articles:
+=20
+ * [Intro to BoltDB: Painless Performant Persistence](http://npf.io/2014/0=
7/intro-to-boltdb-painless-performant-persistence/) by [Nate Finch](https:/=
/github.com/natefinch).
++* [Bolt -- an embedded key/value database for Go](https://www.progville.c=
om/go/bolt-embedded-db-golang/) by Progville
++
++
++## Comparison with other databases
++
++### Postgres, MySQL, & other relational databases
++
++Relational databases structure data into rows and are only accessible thr=
ough
++the use of SQL. This approach provides flexibility in how you store and q=
uery
++your data but also incurs overhead in parsing and planning SQL statements=
. Bolt
++accesses all data by a byte slice key. This makes Bolt fast to read and w=
rite
++data by key but provides no built-in support for joining values together.
++
++Most relational databases (with the exception of SQLite) are standalone s=
ervers
++that run separately from your application. This gives your systems
++flexibility to connect multiple application servers to a single database
++server but also adds overhead in serializing and transporting data over t=
he
++network. Bolt runs as a library included in your application so all data =
access
++has to go through your application's process. This brings data closer to =
your
++application but limits multi-process access to the data.
++
++
++### LevelDB, RocksDB
+=20
++LevelDB and its derivatives (RocksDB, HyperLevelDB) are similar to Bolt i=
n that
++they are libraries bundled into the application, however, their underlyin=
g
++structure is a log-structured merge-tree (LSM tree). An LSM tree optimize=
s
++random writes by using a write ahead log and multi-tiered, sorted files c=
alled
++SSTables. Bolt uses a B+tree internally and only a single file. Both appr=
oaches
++have trade offs.
+=20
++If you require a high random write throughput (>10,000 w/sec) or you need=
 to use
++spinning disks then LevelDB could be a good choice. If your application i=
s
++read-heavy or does a lot of range scans then Bolt could be a good choice.
+=20
+-## Comparing Bolt to LMDB
++One other important consideration is that LevelDB does not have transacti=
ons.
++It supports batch writing of key/values pairs and it supports read snapsh=
ots
++but it will not give you the ability to do a compare-and-swap operation s=
afely.
++Bolt supports fully serializable ACID transactions.
++
++
++### LMDB
+=20
+ Bolt was originally a port of LMDB so it is architecturally similar. Both=
 use
+-a B+tree, have ACID semanetics with fully serializable transactions, and =
support
++a B+tree, have ACID semantics with fully serializable transactions, and s=
upport
+ lock-free MVCC using a single writer and multiple readers.
+=20
+ The two projects have somewhat diverged. LMDB heavily focuses on raw perf=
ormance
+ while Bolt has focused on simplicity and ease of use. For example, LMDB a=
llows
+-several unsafe actions such as direct writes and append writes for the sa=
ke of
+-performance. Bolt opts to disallow actions which can leave the database i=
n a=20
+-corrupted state. The only exception to this in Bolt is `DB.NoSync`.
++several unsafe actions such as direct writes for the sake of performance.=
 Bolt
++opts to disallow actions which can leave the database in a corrupted stat=
e. The
++only exception to this in Bolt is `DB.NoSync`.
++
++There are also a few differences in API. LMDB requires a maximum mmap siz=
e when
++opening an `mdb_env` whereas Bolt will handle incremental mmap resizing
++automatically. LMDB overloads the getter and setter functions with multip=
le
++flags whereas Bolt splits these specialized cases into their own function=
s.
+=20
+=20
+ ## Caveats & Limitations
+@@ -425,14 +612,33 @@ Here are a few things to note when evaluating and us=
ing Bolt:
+   can in memory and will release memory as needed to other processes. Thi=
s means
+   that Bolt can show very high memory usage when working with large datab=
ases.
+   However, this is expected and the OS will release memory as needed. Bol=
t can
+-  handle databases much larger than the available physical RAM.
++  handle databases much larger than the available physical RAM, provided =
its
++  memory-map fits in the process virtual address space. It may be problem=
atic
++  on 32-bits systems.
++
++* The data structures in the Bolt database are memory mapped so the data =
file
++  will be endian specific. This means that you cannot copy a Bolt file fr=
om a
++  little endian machine to a big endian machine and have it work. For mos=
t=20
++  users this is not a concern since most modern CPUs are little endian.
++
++* Because of the way pages are laid out on disk, Bolt cannot truncate dat=
a files
++  and return free pages back to the disk. Instead, Bolt maintains a free =
list
++  of unused pages within its data file. These free pages can be reused by=
 later
++  transactions. This works well for many use cases as databases generally=
 tend
++  to grow. However, it's important to note that deleting large chunks of =
data
++  will not allow you to reclaim that space on disk.
++
++  For more information on page allocation, [see this comment][page-alloca=
tion].
++
++[page-allocation]: https://github.com/boltdb/bolt/issues/308#issuecomment=
-74811638
+=20
+=20
+ ## Other Projects Using Bolt
+=20
+ Below is a list of public, open source projects that use Bolt:
+=20
+-* [Bazil](https://github.com/bazillion/bazil) - A file system that lets y=
our data reside where it is most convenient for it to reside.
++* [Operation Go: A Routine Mission](http://gocode.io) - An online program=
ming game for Golang using Bolt for user accounts and a leaderboard.
++* [Bazil](https://bazil.org/) - A file system that lets your data reside =
where it is most convenient for it to reside.
+ * [DVID](https://github.com/janelia-flyem/dvid) - Added Bolt as optional =
storage engine and testing it against Basho-tuned leveldb.
+ * [Skybox Analytics](https://github.com/skybox/skybox) - A standalone fun=
nel analysis tool for web analytics.
+ * [Scuttlebutt](https://github.com/benbjohnson/scuttlebutt) - Uses Bolt t=
o store and process all Twitter mentions of GitHub projects.
+@@ -450,6 +656,16 @@ Below is a list of public, open source projects that =
use Bolt:
+ * [bleve](http://www.blevesearch.com/) - A pure Go search engine similar =
to ElasticSearch that uses Bolt as the default storage backend.
+ * [tentacool](https://github.com/optiflows/tentacool) - REST api server t=
o manage system stuff (IP, DNS, Gateway...) on a linux server.
+ * [SkyDB](https://github.com/skydb/sky) - Behavioral analytics database.
++* [Seaweed File System](https://github.com/chrislusf/weed-fs) - Highly sc=
alable distributed key~file system with O(1) disk read.
++* [InfluxDB](http://influxdb.com) - Scalable datastore for metrics, event=
s, and real-time analytics.
++* [Freehold](http://tshannon.bitbucket.org/freehold/) - An open, secure, =
and lightweight platform for your files and data.
++* [Prometheus Annotation Server](https://github.com/oliver006/prom_annota=
tion_server) - Annotation server for PromDash & Prometheus service monitori=
ng system.
++* [Consul](https://github.com/hashicorp/consul) - Consul is service disco=
very and configuration made easy. Distributed, highly available, and datace=
nter-aware.
++* [Kala](https://github.com/ajvb/kala) - Kala is a modern job scheduler o=
ptimized to run on a single node. It is persistent, JSON over HTTP API, ISO=
 8601 duration notation, and dependent jobs.
++* [drive](https://github.com/odeke-em/drive) - drive is an unofficial Goo=
gle Drive command line client for \*NIX operating systems.
++* [stow](https://github.com/djherbis/stow) -  a persistence manager for o=
bjects
++  backed by boltdb.
++* [buckets](https://github.com/joyrexus/buckets) - a bolt wrapper streaml=
ining
++  simple tx and key scans.
+=20
+ If you are using Bolt in a project please send a pull request to add it t=
o the list.
+-
+diff --git a/vendor/src/github.com/boltdb/bolt/batch.go b/vendor/src/githu=
b.com/boltdb/bolt/batch.go
+new file mode 100644
+index 0000000..84acae6
+--- /dev/null
++++ b/vendor/src/github.com/boltdb/bolt/batch.go
+@@ -0,0 +1,138 @@
++package bolt
++
++import (
++	"errors"
++	"fmt"
++	"sync"
++	"time"
++)
++
++// Batch calls fn as part of a batch. It behaves similar to Update,
++// except:
++//
++// 1. concurrent Batch calls can be combined into a single Bolt
++// transaction.
++//
++// 2. the function passed to Batch may be called multiple times,
++// regardless of whether it returns error or not.
++//
++// This means that Batch function side effects must be idempotent and
++// take permanent effect only after a successful return is seen in
++// caller.
++//
++// The maximum batch size and delay can be adjusted with DB.MaxBatchSize
++// and DB.MaxBatchDelay, respectively.
++//
++// Batch is only useful when there are multiple goroutines calling it.
++func (db *DB) Batch(fn func(*Tx) error) error {
++	errCh :=3D make(chan error, 1)
++
++	db.batchMu.Lock()
++	if (db.batch =3D=3D nil) || (db.batch !=3D nil && len(db.batch.calls) >=
=3D db.MaxBatchSize) {
++		// There is no existing batch, or the existing batch is full; start a n=
ew one.
++		db.batch =3D &batch{
++			db: db,
++		}
++		db.batch.timer =3D time.AfterFunc(db.MaxBatchDelay, db.batch.trigger)
++	}
++	db.batch.calls =3D append(db.batch.calls, call{fn: fn, err: errCh})
++	if len(db.batch.calls) >=3D db.MaxBatchSize {
++		// wake up batch, it's ready to run
++		go db.batch.trigger()
++	}
++	db.batchMu.Unlock()
++
++	err :=3D <-errCh
++	if err =3D=3D trySolo {
++		err =3D db.Update(fn)
++	}
++	return err
++}
++
++type call struct {
++	fn  func(*Tx) error
++	err chan<- error
++}
++
++type batch struct {
++	db    *DB
++	timer *time.Timer
++	start sync.Once
++	calls []call
++}
++
++// trigger runs the batch if it hasn't already been run.
++func (b *batch) trigger() {
++	b.start.Do(b.run)
++}
++
++// run performs the transactions in the batch and communicates results
++// back to DB.Batch.
++func (b *batch) run() {
++	b.db.batchMu.Lock()
++	b.timer.Stop()
++	// Make sure no new work is added to this batch, but don't break
++	// other batches.
++	if b.db.batch =3D=3D b {
++		b.db.batch =3D nil
++	}
++	b.db.batchMu.Unlock()
++
++retry:
++	for len(b.calls) > 0 {
++		var failIdx =3D -1
++		err :=3D b.db.Update(func(tx *Tx) error {
++			for i, c :=3D range b.calls {
++				if err :=3D safelyCall(c.fn, tx); err !=3D nil {
++					failIdx =3D i
++					return err
++				}
++			}
++			return nil
++		})
++
++		if failIdx >=3D 0 {
++			// take the failing transaction out of the batch. it's
++			// safe to shorten b.calls here because db.batch no longer
++			// points to us, and we hold the mutex anyway.
++			c :=3D b.calls[failIdx]
++			b.calls[failIdx], b.calls =3D b.calls[len(b.calls)-1], b.calls[:len(b.=
calls)-1]
++			// tell the submitter re-run it solo, continue with the rest of the ba=
tch
++			c.err <- trySolo
++			continue retry
++		}
++
++		// pass success, or bolt internal errors, to all callers
++		for _, c :=3D range b.calls {
++			if c.err !=3D nil {
++				c.err <- err
++			}
++		}
++		break retry
++	}
++}
++
++// trySolo is a special sentinel error value used for signaling that a
++// transaction function should be re-run. It should never be seen by
++// callers.
++var trySolo =3D errors.New("batch function returned an error and should b=
e re-run solo")
++
++type panicked struct {
++	reason interface{}
++}
++
++func (p panicked) Error() string {
++	if err, ok :=3D p.reason.(error); ok {
++		return err.Error()
++	}
++	return fmt.Sprintf("panic: %v", p.reason)
++}
++
++func safelyCall(fn func(*Tx) error, tx *Tx) (err error) {
++	defer func() {
++		if p :=3D recover(); p !=3D nil {
++			err =3D panicked{p}
++		}
++	}()
++	return fn(tx)
++}
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_386.go b/vendor/src/gi=
thub.com/boltdb/bolt/bolt_386.go
+index 856f401..e659bfb 100644
+--- a/vendor/src/github.com/boltdb/bolt/bolt_386.go
++++ b/vendor/src/github.com/boltdb/bolt/bolt_386.go
+@@ -1,4 +1,7 @@
+ package bolt
+=20
+ // maxMapSize represents the largest mmap size supported by Bolt.
+-const maxMapSize =3D 0xFFFFFFF // 256MB
++const maxMapSize =3D 0x7FFFFFFF // 2GB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize =3D 0xFFFFFFF
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_amd64.go b/vendor/src/=
github.com/boltdb/bolt/bolt_amd64.go
+index 4262932..cca6b7e 100644
+--- a/vendor/src/github.com/boltdb/bolt/bolt_amd64.go
++++ b/vendor/src/github.com/boltdb/bolt/bolt_amd64.go
+@@ -2,3 +2,6 @@ package bolt
+=20
+ // maxMapSize represents the largest mmap size supported by Bolt.
+ const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize =3D 0x7FFFFFFF
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_arm.go b/vendor/src/gi=
thub.com/boltdb/bolt/bolt_arm.go
+index 856f401..e659bfb 100644
+--- a/vendor/src/github.com/boltdb/bolt/bolt_arm.go
++++ b/vendor/src/github.com/boltdb/bolt/bolt_arm.go
+@@ -1,4 +1,7 @@
+ package bolt
+=20
+ // maxMapSize represents the largest mmap size supported by Bolt.
+-const maxMapSize =3D 0xFFFFFFF // 256MB
++const maxMapSize =3D 0x7FFFFFFF // 2GB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize =3D 0xFFFFFFF
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_arm64.go b/vendor/src/=
github.com/boltdb/bolt/bolt_arm64.go
+new file mode 100644
+index 0000000..6d23093
+--- /dev/null
++++ b/vendor/src/github.com/boltdb/bolt/bolt_arm64.go
+@@ -0,0 +1,9 @@
++// +build arm64
++
++package bolt
++
++// maxMapSize represents the largest mmap size supported by Bolt.
++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize =3D 0x7FFFFFFF
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go b/vendor/sr=
c/github.com/boltdb/bolt/bolt_ppc64le.go
+new file mode 100644
+index 0000000..8351e12
+--- /dev/null
++++ b/vendor/src/github.com/boltdb/bolt/bolt_ppc64le.go
+@@ -0,0 +1,9 @@
++// +build ppc64le
++
++package bolt
++
++// maxMapSize represents the largest mmap size supported by Bolt.
++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize =3D 0x7FFFFFFF
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_s390x.go b/vendor/src/=
github.com/boltdb/bolt/bolt_s390x.go
+new file mode 100644
+index 0000000..f4dd26b
+--- /dev/null
++++ b/vendor/src/github.com/boltdb/bolt/bolt_s390x.go
+@@ -0,0 +1,9 @@
++// +build s390x
++
++package bolt
++
++// maxMapSize represents the largest mmap size supported by Bolt.
++const maxMapSize =3D 0xFFFFFFFFFFFF // 256TB
++
++// maxAllocSize is the size used when creating array pointers.
++const maxAllocSize =3D 0x7FFFFFFF
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_unix.go b/vendor/src/g=
ithub.com/boltdb/bolt/bolt_unix.go
+index 95647a7..6eef6b2 100644
+--- a/vendor/src/github.com/boltdb/bolt/bolt_unix.go
++++ b/vendor/src/github.com/boltdb/bolt/bolt_unix.go
+@@ -1,8 +1,9 @@
+-// +build !windows,!plan9
++// +build !windows,!plan9,!solaris
+=20
+ package bolt
+=20
+ import (
++	"fmt"
+ 	"os"
+ 	"syscall"
+ 	"time"
+@@ -10,7 +11,7 @@ import (
+ )
+=20
+ // flock acquires an advisory lock on a file descriptor.
+-func flock(f *os.File, timeout time.Duration) error {
++func flock(f *os.File, exclusive bool, timeout time.Duration) error {
+ 	var t time.Time
+ 	for {
+ 		// If we're beyond our timeout then return an error.
+@@ -20,9 +21,13 @@ func flock(f *os.File, timeout time.Duration) error {
+ 		} else if timeout > 0 && time.Since(t) > timeout {
+ 			return ErrTimeout
+ 		}
++		flag :=3D syscall.LOCK_SH
++		if exclusive {
++			flag =3D syscall.LOCK_EX
++		}
+=20
+ 		// Otherwise attempt to obtain an exclusive lock.
+-		err :=3D syscall.Flock(int(f.Fd()), syscall.LOCK_EX|syscall.LOCK_NB)
++		err :=3D syscall.Flock(int(f.Fd()), flag|syscall.LOCK_NB)
+ 		if err =3D=3D nil {
+ 			return nil
+ 		} else if err !=3D syscall.EWOULDBLOCK {
+@@ -41,11 +46,28 @@ func funlock(f *os.File) error {
+=20
+ // mmap memory maps a DB's data file.
+ func mmap(db *DB, sz int) error {
++	// Truncate and fsync to ensure file size metadata is flushed.
++	// https://github.com/boltdb/bolt/issues/284
++	if !db.NoGrowSync && !db.readOnly {
++		if err :=3D db.file.Truncate(int64(sz)); err !=3D nil {
++			return fmt.Errorf("file resize error: %s", err)
++		}
++		if err :=3D db.file.Sync(); err !=3D nil {
++			return fmt.Errorf("file sync error: %s", err)
++		}
++	}
++
++	// Map the data file to memory.
+ 	b, err :=3D syscall.Mmap(int(db.file.Fd()), 0, sz, syscall.PROT_READ, sy=
scall.MAP_SHARED)
+ 	if err !=3D nil {
+ 		return err
+ 	}
+=20
++	// Advise the kernel that the mmap is accessed randomly.
++	if err :=3D madvise(b, syscall.MADV_RANDOM); err !=3D nil {
++		return fmt.Errorf("madvise: %s", err)
++	}
++
+ 	// Save the original byte slice and convert to a byte array pointer.
+ 	db.dataref =3D b
+ 	db.data =3D (*[maxMapSize]byte)(unsafe.Pointer(&b[0]))
+@@ -67,3 +89,12 @@ func munmap(db *DB) error {
+ 	db.datasz =3D 0
+ 	return err
+ }
++
++// NOTE: This function is copied from stdlib because it is not available =
on darwin.
++func madvise(b []byte, advice int) (err error) {
++	_, _, e1 :=3D syscall.Syscall(syscall.SYS_MADVISE, uintptr(unsafe.Pointe=
r(&b[0])), uintptr(len(b)), uintptr(advice))
++	if e1 !=3D 0 {
++		err =3D e1
++	}
++	return
++}
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_unix_solaris.go b/vend=
or/src/github.com/boltdb/bolt/bolt_unix_solaris.go
+new file mode 100644
+index 0000000..f480ee7
+--- /dev/null
++++ b/vendor/src/github.com/boltdb/bolt/bolt_unix_solaris.go
+@@ -0,0 +1,101 @@
++
++package bolt
++
++import (
++	"fmt"
++	"os"
++	"syscall"
++	"time"
++	"unsafe"
++	"golang.org/x/sys/unix"
++)
++
++// flock acquires an advisory lock on a file descriptor.
++func flock(f *os.File, exclusive bool, timeout time.Duration) error {
++	var t time.Time
++	for {
++		// If we're beyond our timeout then return an error.
++		// This can only occur after we've attempted a flock once.
++		if t.IsZero() {
++			t =3D time.Now()
++		} else if timeout > 0 && time.Since(t) > timeout {
++			return ErrTimeout
++		}
++		var lock syscall.Flock_t
++		lock.Start =3D 0
++		lock.Len =3D 0
++		lock.Pid =3D 0
++		lock.Whence =3D 0
++		lock.Pid =3D 0
++		if exclusive {
++			lock.Type =3D syscall.F_WRLCK
++		} else {
++			lock.Type =3D syscall.F_RDLCK
++		}
++		err :=3D syscall.FcntlFlock(f.Fd(), syscall.F_SETLK, &lock)
++		if err =3D=3D nil {
++			return nil
++		} else if err !=3D syscall.EAGAIN {
++			return err
++		}
++
++		// Wait for a bit and try again.
++		time.Sleep(50 * time.Millisecond)
++	}
++}
++
++// funlock releases an advisory lock on a file descriptor.
++func funlock(f *os.File) error {
++	var lock syscall.Flock_t
++	lock.Start =3D 0
++	lock.Len =3D 0
++	lock.Type =3D syscall.F_UNLCK
++	lock.Whence =3D 0
++	return syscall.FcntlFlock(uintptr(f.Fd()), syscall.F_SETLK, &lock)
++}
++
++// mmap memory maps a DB's data file.
++func mmap(db *DB, sz int) error {
++	// Truncate and fsync to ensure file size metadata is flushed.
++	// https://github.com/boltdb/bolt/issues/284
++	if !db.NoGrowSync && !db.readOnly {
++		if err :=3D db.file.Truncate(int64(sz)); err !=3D nil {
++			return fmt.Errorf("file resize error: %s", err)
++		}
++		if err :=3D db.file.Sync(); err !=3D nil {
++			return fmt.Errorf("file sync error: %s", err)
++		}
++	}
++
++	// Map the data file to memory.
++	b, err :=3D unix.Mmap(int(db.file.Fd()), 0, sz, syscall.PROT_READ, sysca=
ll.MAP_SHARED)
++	if err !=3D nil {
++		return err
++	}
++
++	// Advise the kernel that the mmap is accessed randomly.
++	if err :=3D unix.Madvise(b, syscall.MADV_RANDOM); err !=3D nil {
++		return fmt.Errorf("madvise: %s", err)
++	}
++
++	// Save the original byte slice and convert to a byte array pointer.
++	db.dataref =3D b
++	db.data =3D (*[maxMapSize]byte)(unsafe.Pointer(&b[0]))
++	db.datasz =3D sz
++	return nil
++}
++
++// munmap unmaps a DB's data file from memory.
++func munmap(db *DB) error {
++	// Ignore the unmap if we have no mapped data.
++	if db.dataref =3D=3D nil {
++		return nil
++	}
++
++	// Unmap using the original byte slice.
++	err :=3D unix.Munmap(db.dataref)
++	db.dataref =3D nil
++	db.data =3D nil
++	db.datasz =3D 0
++	return err
++}
+diff --git a/vendor/src/github.com/boltdb/bolt/bolt_windows.go b/vendor/sr=
c/github.com/boltdb/bolt/bolt_windows.go
+index c8539d4..8b782be 100644
+--- a/vendor/src/github.com/boltdb/bolt/bolt_windows.go
++++ b/vendor/src/github.com/boltdb/bolt/bolt_windows.go
+@@ -16,7 +16,7 @@ func fdatasync(db *DB) error {
+ }
+=20
+ // flock acquires an advisory lock on a file descriptor.
+-func flock(f *os.File, _ time.Duration) error {
++func flock(f *os.File, _ bool, _ time.Duration) error {
+ 	return nil
+ }
+=20
+@@ -28,9 +28,11 @@ func funlock(f *os.File) error {
+ // mmap memory maps a DB's data file.
+ // Based on: https://github.com/edsrzf/mmap-go
+ func mmap(db *DB, sz int) error {
+-	// Truncate the database to the size of the mmap.
+-	if err :=3D db.file.Truncate(int64(sz)); err !=3D nil {
+-		return fmt.Errorf("truncate: %s", err)
++	if !db.readOnly {
++		// Truncate the database to the size of the mmap.
++		if err :=3D db.file.Truncate(int64(sz)); err !=3D nil {
++			return fmt.Errorf("truncate: %s", err)
++		}
+ 	}
+=20
+ 	// Open a file mapping handle.
+diff --git a/vendor/src/github.com/boltdb/bolt/bucket.go b/vendor/src/gith=
ub.com/boltdb/bolt/bucket.go
+index 2630800..2925288 100644
+--- a/vendor/src/github.com/boltdb/bolt/bucket.go
++++ b/vendor/src/github.com/boltdb/bolt/bucket.go
+@@ -99,6 +99,7 @@ func (b *Bucket) Cursor() *Cursor {
+=20
+ // Bucket retrieves a nested bucket by name.
+ // Returns nil if the bucket does not exist.
++// The bucket instance is only valid for the lifetime of the transaction.
+ func (b *Bucket) Bucket(name []byte) *Bucket {
+ 	if b.buckets !=3D nil {
+ 		if child :=3D b.buckets[string(name)]; child !=3D nil {
+@@ -148,6 +149,7 @@ func (b *Bucket) openBucket(value []byte) *Bucket {
+=20
+ // CreateBucket creates a new bucket at the given key and returns the new=
 bucket.
+ // Returns an error if the key already exists, if the bucket name is blan=
k, or if the bucket name is too long.
++// The bucket instance is only valid for the lifetime of the transaction.
+ func (b *Bucket) CreateBucket(key []byte) (*Bucket, error) {
+ 	if b.tx.db =3D=3D nil {
+ 		return nil, ErrTxClosed
+@@ -192,6 +194,7 @@ func (b *Bucket) CreateBucket(key []byte) (*Bucket, er=
ror) {
+=20
+ // CreateBucketIfNotExists creates a new bucket if it doesn't already exi=
st and returns a reference to it.
+ // Returns an error if the bucket name is blank, or if the bucket name is=
 too long.
++// The bucket instance is only valid for the lifetime of the transaction.
+ func (b *Bucket) CreateBucketIfNotExists(key []byte) (*Bucket, error) {
+ 	child, err :=3D b.CreateBucket(key)
+ 	if err =3D=3D ErrBucketExists {
+@@ -252,6 +255,7 @@ func (b *Bucket) DeleteBucket(key []byte) error {
+=20
+ // Get retrieves the value for a key in the bucket.
+ // Returns a nil value if the key does not exist or if the key is a neste=
d bucket.
++// The returned value is only valid for the life of the transaction.
+ func (b *Bucket) Get(key []byte) []byte {
+ 	k, v, flags :=3D b.Cursor().seek(key)
+=20
+@@ -332,6 +336,12 @@ func (b *Bucket) NextSequence() (uint64, error) {
+ 		return 0, ErrTxNotWritable
+ 	}
+=20
++	// Materialize the root node if it hasn't been already so that the
++	// bucket will be saved during commit.
++	if b.rootNode =3D=3D nil {
++		_ =3D b.node(b.root, nil)
++	}
++
+ 	// Increment and return the sequence.
+ 	b.bucket.sequence++
+ 	return b.bucket.sequence, nil
+@@ -339,7 +349,8 @@ func (b *Bucket) NextSequence() (uint64, error) {
+=20
+ // ForEach executes a function for each key/value pair in a bucket.
+ // If the provided function returns an error then the iteration is stoppe=
d and
+-// the error is returned to the caller.
++// the error is returned to the caller. The provided function must not mo=
dify
++// the bucket; this will result in undefined behavior.
+ func (b *Bucket) ForEach(fn func(k, v []byte) error) error {
+ 	if b.tx.db =3D=3D nil {
+ 		return ErrTxClosed
+@@ -511,8 +522,12 @@ func (b *Bucket) spill() error {
+ 		// Update parent node.
+ 		var c =3D b.Cursor()
+ 		k, _, flags :=3D c.seek([]byte(name))
+-		_assert(bytes.Equal([]byte(name), k), "misplaced bucket header: %x -> %=
x", []byte(name), k)
+-		_assert(flags&bucketLeafFlag !=3D 0, "unexpected bucket header flag: %x=
", flags)
++		if !bytes.Equal([]byte(name), k) {
++			panic(fmt.Sprintf("misplaced bucket header: %x -> %x", []byte(name), k=
))
++		}
++		if flags&bucketLeafFlag =3D=3D 0 {
++			panic(fmt.Sprintf("unexpected bucket header flag: %x", flags))
++		}
+ 		c.node().put([]byte(name), []byte(name), value, 0, bucketLeafFlag)
+ 	}
+=20
+@@ -528,7 +543,9 @@ func (b *Bucket) spill() error {
+ 	b.rootNode =3D b.rootNode.root()
+=20
+ 	// Update the root node for this bucket.
+-	_assert(b.rootNode.pgid < b.tx.meta.pgid, "pgid (%d) above high water ma=
rk (%d)", b.rootNode.pgid, b.tx.meta.pgid)
++	if b.rootNode.pgid >=3D b.tx.meta.pgid {
++		panic(fmt.Sprintf("pgid (%d) above high water mark (%d)", b.rootNode.pg=
id, b.tx.meta.pgid))
++	}
+ 	b.root =3D b.rootNode.pgid
+=20
+ 	return nil
+@@ -659,7 +676,9 @@ func (b *Bucket) pageNode(id pgid) (*page, *node) {
+ 	// Inline buckets have a fake page embedded in their value so treat them
+ 	// differently. We'll return the rootNode (if available) or the fake pag=
e.
+ 	if b.root =3D=3D 0 {
+-		_assert(id =3D=3D 0, "inline bucket non-zero page access(2): %d !=3D 0"=
, id)
++		if id !=3D 0 {
++			panic(fmt.Sprintf("inline bucket non-zero page access(2): %d !=3D 0", =
id))
++		}
+ 		if b.rootNode !=3D nil {
+ 			return nil, b.rootNode
+ 		}
+diff --git a/vendor/src/github.com/boltdb/bolt/cursor.go b/vendor/src/gith=
ub.com/boltdb/bolt/cursor.go
+index 3bfc2f1..006c548 100644
+--- a/vendor/src/github.com/boltdb/bolt/cursor.go
++++ b/vendor/src/github.com/boltdb/bolt/cursor.go
+@@ -2,6 +2,7 @@ package bolt
+=20
+ import (
+ 	"bytes"
++	"fmt"
+ 	"sort"
+ )
+=20
+@@ -9,6 +10,8 @@ import (
+ // Cursors see nested buckets with value =3D=3D nil.
+ // Cursors can be obtained from a transaction and are valid as long as th=
e transaction is open.
+ //
++// Keys and values returned from the cursor are only valid for the life o=
f the transaction.
++//
+ // Changing data while traversing with a cursor may cause it to be invali=
dated
+ // and return unexpected keys and/or values. You must reposition your cur=
sor
+ // after mutating data.
+@@ -24,6 +27,7 @@ func (c *Cursor) Bucket() *Bucket {
+=20
+ // First moves the cursor to the first item in the bucket and returns its=
 key and value.
+ // If the bucket is empty then a nil key and value are returned.
++// The returned key and value are only valid for the life of the transact=
ion.
+ func (c *Cursor) First() (key []byte, value []byte) {
+ 	_assert(c.bucket.tx.db !=3D nil, "tx closed")
+ 	c.stack =3D c.stack[:0]
+@@ -40,6 +44,7 @@ func (c *Cursor) First() (key []byte, value []byte) {
+=20
+ // Last moves the cursor to the last item in the bucket and returns its k=
ey and value.
+ // If the bucket is empty then a nil key and value are returned.
++// The returned key and value are only valid for the life of the transact=
ion.
+ func (c *Cursor) Last() (key []byte, value []byte) {
+ 	_assert(c.bucket.tx.db !=3D nil, "tx closed")
+ 	c.stack =3D c.stack[:0]
+@@ -57,6 +62,7 @@ func (c *Cursor) Last() (key []byte, value []byte) {
+=20
+ // Next moves the cursor to the next item in the bucket and returns its k=
ey and value.
+ // If the cursor is at the end of the bucket then a nil key and value are=
 returned.
++// The returned key and value are only valid for the life of the transact=
ion.
+ func (c *Cursor) Next() (key []byte, value []byte) {
+ 	_assert(c.bucket.tx.db !=3D nil, "tx closed")
+ 	k, v, flags :=3D c.next()
+@@ -68,6 +74,7 @@ func (c *Cursor) Next() (key []byte, value []byte) {
+=20
+ // Prev moves the cursor to the previous item in the bucket and returns i=
ts key and value.
+ // If the cursor is at the beginning of the bucket then a nil key and val=
ue are returned.
++// The returned key and value are only valid for the life of the transact=
ion.
+ func (c *Cursor) Prev() (key []byte, value []byte) {
+ 	_assert(c.bucket.tx.db !=3D nil, "tx closed")
+=20
+@@ -99,6 +106,7 @@ func (c *Cursor) Prev() (key []byte, value []byte) {
+ // Seek moves the cursor to a given key and returns it.
+ // If the key does not exist then the next key is used. If no keys
+ // follow, a nil key is returned.
++// The returned key and value are only valid for the life of the transact=
ion.
+ func (c *Cursor) Seek(seek []byte) (key []byte, value []byte) {
+ 	k, v, flags :=3D c.seek(seek)
+=20
+@@ -228,8 +236,8 @@ func (c *Cursor) next() (key []byte, value []byte, fla=
gs uint32) {
+ // search recursively performs a binary search against a given page/node =
until it finds a given key.
+ func (c *Cursor) search(key []byte, pgid pgid) {
+ 	p, n :=3D c.bucket.pageNode(pgid)
+-	if p !=3D nil {
+-		_assert((p.flags&(branchPageFlag|leafPageFlag)) !=3D 0, "invalid page t=
ype: %d: %x", p.id, p.flags)
++	if p !=3D nil && (p.flags&(branchPageFlag|leafPageFlag)) =3D=3D 0 {
++		panic(fmt.Sprintf("invalid page type: %d: %x", p.id, p.flags))
+ 	}
+ 	e :=3D elemRef{page: p, node: n}
+ 	c.stack =3D append(c.stack, e)
+diff --git a/vendor/src/github.com/boltdb/bolt/db.go b/vendor/src/github.c=
om/boltdb/bolt/db.go
+index 6c45736..d39c4aa 100644
+--- a/vendor/src/github.com/boltdb/bolt/db.go
++++ b/vendor/src/github.com/boltdb/bolt/db.go
+@@ -12,9 +12,6 @@ import (
+ 	"unsafe"
+ )
+=20
+-// The smallest size that the mmap can be.
+-const minMmapSize =3D 1 << 22 // 4MB
+-
+ // The largest step that can be taken when remapping the mmap.
+ const maxMmapStep =3D 1 << 30 // 1GB
+=20
+@@ -30,6 +27,12 @@ const magic uint32 =3D 0xED0CDAED
+ // must be synchronzied using the msync(2) syscall.
+ const IgnoreNoSync =3D runtime.GOOS =3D=3D "openbsd"
+=20
++// Default values if not set in a DB instance.
++const (
++	DefaultMaxBatchSize  int =3D 1000
++	DefaultMaxBatchDelay     =3D 10 * time.Millisecond
++)
++
+ // DB represents a collection of buckets persisted to a file on disk.
+ // All data access is performed through transactions which can be obtaine=
d through the DB.
+ // All the functions on DB will return a ErrDatabaseNotOpen if accessed b=
efore Open() is called.
+@@ -52,9 +55,33 @@ type DB struct {
+ 	// THIS IS UNSAFE. PLEASE USE WITH CAUTION.
+ 	NoSync bool
+=20
++	// When true, skips the truncate call when growing the database.
++	// Setting this to true is only safe on non-ext3/ext4 systems.
++	// Skipping truncation avoids preallocation of hard drive space and
++	// bypasses a truncate() and fsync() syscall on remapping.
++	//
++	// https://github.com/boltdb/bolt/issues/284
++	NoGrowSync bool
++
++	// MaxBatchSize is the maximum size of a batch. Default value is
++	// copied from DefaultMaxBatchSize in Open.
++	//
++	// If <=3D0, disables batching.
++	//
++	// Do not change concurrently with calls to Batch.
++	MaxBatchSize int
++
++	// MaxBatchDelay is the maximum delay before a batch starts.
++	// Default value is copied from DefaultMaxBatchDelay in Open.
++	//
++	// If <=3D0, effectively disables batching.
++	//
++	// Do not change concurrently with calls to Batch.
++	MaxBatchDelay time.Duration
++
+ 	path     string
+ 	file     *os.File
+-	dataref  []byte
++	dataref  []byte // mmap'ed readonly, write throws SEGV
+ 	data     *[maxMapSize]byte
+ 	datasz   int
+ 	meta0    *meta
+@@ -66,6 +93,9 @@ type DB struct {
+ 	freelist *freelist
+ 	stats    Stats
+=20
++	batchMu sync.Mutex
++	batch   *batch
++
+ 	rwlock   sync.Mutex   // Allows only one writer at a time.
+ 	metalock sync.Mutex   // Protects meta page access.
+ 	mmaplock sync.RWMutex // Protects mmap access during remapping.
+@@ -74,6 +104,10 @@ type DB struct {
+ 	ops struct {
+ 		writeAt func(b []byte, off int64) (n int, err error)
+ 	}
++
++	// Read only mode.
++	// When true, Update() and Begin(true) return ErrDatabaseReadOnly immedi=
ately.
++	readOnly bool
+ }
+=20
+ // Path returns the path to currently open database file.
+@@ -101,20 +135,34 @@ func Open(path string, mode os.FileMode, options *Op=
tions) (*DB, error) {
+ 	if options =3D=3D nil {
+ 		options =3D DefaultOptions
+ 	}
++	db.NoGrowSync =3D options.NoGrowSync
++
++	// Set default values for later DB operations.
++	db.MaxBatchSize =3D DefaultMaxBatchSize
++	db.MaxBatchDelay =3D DefaultMaxBatchDelay
++
++	flag :=3D os.O_RDWR
++	if options.ReadOnly {
++		flag =3D os.O_RDONLY
++		db.readOnly =3D true
++	}
+=20
+ 	// Open data file and separate sync handler for metadata writes.
+ 	db.path =3D path
+-
+ 	var err error
+-	if db.file, err =3D os.OpenFile(db.path, os.O_RDWR|os.O_CREATE, mode); e=
rr !=3D nil {
++	if db.file, err =3D os.OpenFile(db.path, flag|os.O_CREATE, mode); err !=
=3D nil {
+ 		_ =3D db.close()
+ 		return nil, err
+ 	}
+=20
+-	// Lock file so that other processes using Bolt cannot use the database
+-	// at the same time. This would cause corruption since the two processes
+-	// would write meta pages and free pages separately.
+-	if err :=3D flock(db.file, options.Timeout); err !=3D nil {
++	// Lock file so that other processes using Bolt in read-write mode canno=
t
++	// use the database  at the same time. This would cause corruption since
++	// the two processes would write meta pages and free pages separately.
++	// The database file is locked exclusively (only one process can grab th=
e lock)
++	// if !options.ReadOnly.
++	// The database file is locked using the shared lock (more than one proc=
ess may
++	// hold a lock at the same time) otherwise (options.ReadOnly is set).
++	if err :=3D flock(db.file, !db.readOnly, options.Timeout); err !=3D nil =
{
+ 		_ =3D db.close()
+ 		return nil, err
+ 	}
+@@ -162,16 +210,6 @@ func (db *DB) mmap(minsz int) error {
+ 	db.mmaplock.Lock()
+ 	defer db.mmaplock.Unlock()
+=20
+-	// Dereference all mmap references before unmapping.
+-	if db.rwtx !=3D nil {
+-		db.rwtx.root.dereference()
+-	}
+-
+-	// Unmap existing data before continuing.
+-	if err :=3D db.munmap(); err !=3D nil {
+-		return err
+-	}
+-
+ 	info, err :=3D db.file.Stat()
+ 	if err !=3D nil {
+ 		return fmt.Errorf("mmap stat error: %s", err)
+@@ -184,7 +222,20 @@ func (db *DB) mmap(minsz int) error {
+ 	if size < minsz {
+ 		size =3D minsz
+ 	}
+-	size =3D db.mmapSize(size)
++	size, err =3D db.mmapSize(size)
++	if err !=3D nil {
++		return err
++	}
++
++	// Dereference all mmap references before unmapping.
++	if db.rwtx !=3D nil {
++		db.rwtx.root.dereference()
++	}
++
++	// Unmap existing data before continuing.
++	if err :=3D db.munmap(); err !=3D nil {
++		return err
++	}
+=20
+ 	// Memory-map the data file as a byte slice.
+ 	if err :=3D mmap(db, size); err !=3D nil {
+@@ -215,22 +266,40 @@ func (db *DB) munmap() error {
+ }
+=20
+ // mmapSize determines the appropriate size for the mmap given the curren=
t size
+-// of the database. The minimum size is 4MB and doubles until it reaches =
1GB.
+-func (db *DB) mmapSize(size int) int {
+-	if size <=3D minMmapSize {
+-		return minMmapSize
+-	} else if size < maxMmapStep {
+-		size *=3D 2
+-	} else {
+-		size +=3D maxMmapStep
++// of the database. The minimum size is 1MB and doubles until it reaches =
1GB.
++// Returns an error if the new mmap size is greater than the max allowed.
++func (db *DB) mmapSize(size int) (int, error) {
++	// Double the size from 32KB until 1GB.
++	for i :=3D uint(15); i <=3D 30; i++ {
++		if size <=3D 1<<i {
++			return 1 << i, nil
++		}
++	}
++
++	// Verify the requested size is not above the maximum allowed.
++	if size > maxMapSize {
++		return 0, fmt.Errorf("mmap too large")
++	}
++
++	// If larger than 1GB then grow by 1GB at a time.
++	sz :=3D int64(size)
++	if remainder :=3D sz % int64(maxMmapStep); remainder > 0 {
++		sz +=3D int64(maxMmapStep) - remainder
+ 	}
+=20
+ 	// Ensure that the mmap size is a multiple of the page size.
+-	if (size % db.pageSize) !=3D 0 {
+-		size =3D ((size / db.pageSize) + 1) * db.pageSize
++	// This should always be true since we're incrementing in MBs.
++	pageSize :=3D int64(db.pageSize)
++	if (sz % pageSize) !=3D 0 {
++		sz =3D ((sz / pageSize) + 1) * pageSize
++	}
++
++	// If we've exceeded the max size then only grow up to the max size.
++	if sz > maxMapSize {
++		sz =3D maxMapSize
+ 	}
+=20
+-	return size
++	return int(sz), nil
+ }
+=20
+ // init creates a new database file and initializes its meta pages.
+@@ -250,7 +319,6 @@ func (db *DB) init() error {
+ 		m.magic =3D magic
+ 		m.version =3D version
+ 		m.pageSize =3D uint32(db.pageSize)
+-		m.version =3D version
+ 		m.freelist =3D 2
+ 		m.root =3D bucket{root: 3}
+ 		m.pgid =3D 4
+@@ -283,8 +351,15 @@ func (db *DB) init() error {
+ // Close releases all database resources.
+ // All transactions must be closed before closing the database.
+ func (db *DB) Close() error {
++	db.rwlock.Lock()
++	defer db.rwlock.Unlock()
++
+ 	db.metalock.Lock()
+ 	defer db.metalock.Unlock()
++
++	db.mmaplock.RLock()
++	defer db.mmaplock.RUnlock()
++
+ 	return db.close()
+ }
+=20
+@@ -304,8 +379,11 @@ func (db *DB) close() error {
+=20
+ 	// Close file handles.
+ 	if db.file !=3D nil {
+-		// Unlock the file.
+-		_ =3D funlock(db.file)
++		// No need to unlock read-only file.
++		if !db.readOnly {
++			// Unlock the file.
++			_ =3D funlock(db.file)
++		}
+=20
+ 		// Close the file descriptor.
+ 		if err :=3D db.file.Close(); err !=3D nil {
+@@ -323,6 +401,11 @@ func (db *DB) close() error {
+ // will cause the calls to block and be serialized until the current writ=
e
+ // transaction finishes.
+ //
++// Transactions should not be depedent on one another. Opening a read
++// transaction and a write transaction in the same goroutine can cause th=
e
++// writer to deadlock because the database periodically needs to re-mmap =
itself
++// as it grows and it cannot do that while a read transaction is open.
++//
+ // IMPORTANT: You must close read-only transactions after you are finishe=
d or
+ // else the database will not reclaim old pages.
+ func (db *DB) Begin(writable bool) (*Tx, error) {
+@@ -371,6 +454,11 @@ func (db *DB) beginTx() (*Tx, error) {
+ }
+=20
+ func (db *DB) beginRWTx() (*Tx, error) {
++	// If the database was opened with Options.ReadOnly, return an error.
++	if db.readOnly {
++		return nil, ErrDatabaseReadOnly
++	}
++
+ 	// Obtain writer lock. This is released by the transaction when it close=
s.
+ 	// This enforces only one writer transaction at a time.
+ 	db.rwlock.Lock()
+@@ -501,6 +589,12 @@ func (db *DB) View(fn func(*Tx) error) error {
+ 	return nil
+ }
+=20
++// Sync executes fdatasync() against the database file handle.
++//
++// This is not necessary under normal operation, however, if you use NoSy=
nc
++// then it allows you to force the database file to sync against the disk=
.
++func (db *DB) Sync() error { return fdatasync(db) }
++
+ // Stats retrieves ongoing performance stats for the database.
+ // This is only updated when a transaction closes.
+ func (db *DB) Stats() Stats {
+@@ -561,18 +655,30 @@ func (db *DB) allocate(count int) (*page, error) {
+ 	return p, nil
+ }
+=20
++func (db *DB) IsReadOnly() bool {
++	return db.readOnly
++}
++
+ // Options represents the options that can be set when opening a database=
.
+ type Options struct {
+ 	// Timeout is the amount of time to wait to obtain a file lock.
+ 	// When set to zero it will wait indefinitely. This option is only
+ 	// available on Darwin and Linux.
+ 	Timeout time.Duration
++
++	// Sets the DB.NoGrowSync flag before memory mapping the file.
++	NoGrowSync bool
++
++	// Open database in read-only mode. Uses flock(..., LOCK_SH |LOCK_NB) to
++	// grab a shared lock (UNIX).
++	ReadOnly bool
+ }
+=20
+ // DefaultOptions represent the options used if nil options are passed in=
to Open().
+ // No timeout is used which will cause Bolt to wait indefinitely for a lo=
ck.
+ var DefaultOptions =3D &Options{
+-	Timeout: 0,
++	Timeout:    0,
++	NoGrowSync: false,
+ }
+=20
+ // Stats represents statistics about the database.
+@@ -647,9 +753,11 @@ func (m *meta) copy(dest *meta) {
+=20
+ // write writes the meta onto a page.
+ func (m *meta) write(p *page) {
+-
+-	_assert(m.root.root < m.pgid, "root bucket pgid (%d) above high water ma=
rk (%d)", m.root.root, m.pgid)
+-	_assert(m.freelist < m.pgid, "freelist pgid (%d) above high water mark (=
%d)", m.freelist, m.pgid)
++	if m.root.root >=3D m.pgid {
++		panic(fmt.Sprintf("root bucket pgid (%d) above high water mark (%d)", m=
.root.root, m.pgid))
++	} else if m.freelist >=3D m.pgid {
++		panic(fmt.Sprintf("freelist pgid (%d) above high water mark (%d)", m.fr=
eelist, m.pgid))
++	}
+=20
+ 	// Page id is either going to be 0 or 1 which we can determine by the tr=
ansaction ID.
+ 	p.id =3D pgid(m.txid % 2)
+@@ -675,13 +783,8 @@ func _assert(condition bool, msg string, v ...interfa=
ce{}) {
+ 	}
+ }
+=20
+-func warn(v ...interface{}) {
+-	fmt.Fprintln(os.Stderr, v...)
+-}
+-
+-func warnf(msg string, v ...interface{}) {
+-	fmt.Fprintf(os.Stderr, msg+"\n", v...)
+-}
++func warn(v ...interface{})              { fmt.Fprintln(os.Stderr, v...) =
}
++func warnf(msg string, v ...interface{}) { fmt.Fprintf(os.Stderr, msg+"\n=
", v...) }
+=20
+ func printstack() {
+ 	stack :=3D strings.Join(strings.Split(string(debug.Stack()), "\n")[2:], =
"\n")
+diff --git a/vendor/src/github.com/boltdb/bolt/errors.go b/vendor/src/gith=
ub.com/boltdb/bolt/errors.go
+index aa504f1..6883786 100644
+--- a/vendor/src/github.com/boltdb/bolt/errors.go
++++ b/vendor/src/github.com/boltdb/bolt/errors.go
+@@ -36,6 +36,10 @@ var (
+ 	// ErrTxClosed is returned when committing or rolling back a transaction
+ 	// that has already been committed or rolled back.
+ 	ErrTxClosed =3D errors.New("tx closed")
++
++	// ErrDatabaseReadOnly is returned when a mutating transaction is starte=
d on a
++	// read-only database.
++	ErrDatabaseReadOnly =3D errors.New("database is in read-only mode")
+ )
+=20
+ // These errors can occur when putting or deleting a value or a bucket.
+diff --git a/vendor/src/github.com/boltdb/bolt/freelist.go b/vendor/src/gi=
thub.com/boltdb/bolt/freelist.go
+index 150e3e6..0161948 100644
+--- a/vendor/src/github.com/boltdb/bolt/freelist.go
++++ b/vendor/src/github.com/boltdb/bolt/freelist.go
+@@ -1,6 +1,7 @@
+ package bolt
+=20
+ import (
++	"fmt"
+ 	"sort"
+ 	"unsafe"
+ )
+@@ -47,15 +48,14 @@ func (f *freelist) pending_count() int {
+=20
+ // all returns a list of all free ids and all pending ids in one sorted l=
ist.
+ func (f *freelist) all() []pgid {
+-	ids :=3D make([]pgid, len(f.ids))
+-	copy(ids, f.ids)
++	m :=3D make(pgids, 0)
+=20
+ 	for _, list :=3D range f.pending {
+-		ids =3D append(ids, list...)
++		m =3D append(m, list...)
+ 	}
+=20
+-	sort.Sort(pgids(ids))
+-	return ids
++	sort.Sort(m)
++	return pgids(f.ids).merge(m)
+ }
+=20
+ // allocate returns the starting page id of a contiguous list of pages of=
 a given size.
+@@ -67,7 +67,9 @@ func (f *freelist) allocate(n int) pgid {
+=20
+ 	var initial, previd pgid
+ 	for i, id :=3D range f.ids {
+-		_assert(id > 1, "invalid page allocation: %d", id)
++		if id <=3D 1 {
++			panic(fmt.Sprintf("invalid page allocation: %d", id))
++		}
+=20
+ 		// Reset initial page if this is not contiguous.
+ 		if previd =3D=3D 0 || id-previd !=3D 1 {
+@@ -103,13 +105,17 @@ func (f *freelist) allocate(n int) pgid {
+ // free releases a page and its overflow for a given transaction id.
+ // If the page is already free then a panic will occur.
+ func (f *freelist) free(txid txid, p *page) {
+-	_assert(p.id > 1, "cannot free page 0 or 1: %d", p.id)
++	if p.id <=3D 1 {
++		panic(fmt.Sprintf("cannot free page 0 or 1: %d", p.id))
++	}
+=20
+ 	// Free page and all its overflow pages.
+ 	var ids =3D f.pending[txid]
+ 	for id :=3D p.id; id <=3D p.id+pgid(p.overflow); id++ {
+ 		// Verify that page is not already free.
+-		_assert(!f.cache[id], "page %d already freed", id)
++		if f.cache[id] {
++			panic(fmt.Sprintf("page %d already freed", id))
++		}
+=20
+ 		// Add to the freelist and cache.
+ 		ids =3D append(ids, id)
+@@ -120,15 +126,17 @@ func (f *freelist) free(txid txid, p *page) {
+=20
+ // release moves all page ids for a transaction id (or older) to the free=
list.
+ func (f *freelist) release(txid txid) {
++	m :=3D make(pgids, 0)
+ 	for tid, ids :=3D range f.pending {
+ 		if tid <=3D txid {
+ 			// Move transaction's pending pages to the available freelist.
+ 			// Don't remove from the cache since the page is still free.
+-			f.ids =3D append(f.ids, ids...)
++			m =3D append(m, ids...)
+ 			delete(f.pending, tid)
+ 		}
+ 	}
+-	sort.Sort(pgids(f.ids))
++	sort.Sort(m)
++	f.ids =3D pgids(f.ids).merge(m)
+ }
+=20
+ // rollback removes the pages from a given pending tx.
+diff --git a/vendor/src/github.com/boltdb/bolt/node.go b/vendor/src/github=
.com/boltdb/bolt/node.go
+index c204c39..c9fb21c 100644
+--- a/vendor/src/github.com/boltdb/bolt/node.go
++++ b/vendor/src/github.com/boltdb/bolt/node.go
+@@ -2,6 +2,7 @@ package bolt
+=20
+ import (
+ 	"bytes"
++	"fmt"
+ 	"sort"
+ 	"unsafe"
+ )
+@@ -70,7 +71,9 @@ func (n *node) pageElementSize() int {
+=20
+ // childAt returns the child node at a given index.
+ func (n *node) childAt(index int) *node {
+-	_assert(!n.isLeaf, "invalid childAt(%d) on a leaf node", index)
++	if n.isLeaf {
++		panic(fmt.Sprintf("invalid childAt(%d) on a leaf node", index))
++	}
+ 	return n.bucket.node(n.inodes[index].pgid, n)
+ }
+=20
+@@ -111,9 +114,13 @@ func (n *node) prevSibling() *node {
+=20
+ // put inserts a key/value.
+ func (n *node) put(oldKey, newKey, value []byte, pgid pgid, flags uint32)=
 {
+-	_assert(pgid < n.bucket.tx.meta.pgid, "pgid (%d) above high water mark (=
%d)", pgid, n.bucket.tx.meta.pgid)
+-	_assert(len(oldKey) > 0, "put: zero-length old key")
+-	_assert(len(newKey) > 0, "put: zero-length new key")
++	if pgid >=3D n.bucket.tx.meta.pgid {
++		panic(fmt.Sprintf("pgid (%d) above high water mark (%d)", pgid, n.bucke=
t.tx.meta.pgid))
++	} else if len(oldKey) <=3D 0 {
++		panic("put: zero-length old key")
++	} else if len(newKey) <=3D 0 {
++		panic("put: zero-length new key")
++	}
+=20
+ 	// Find insertion index.
+ 	index :=3D sort.Search(len(n.inodes), func(i int) bool { return bytes.Co=
mpare(n.inodes[i].key, oldKey) !=3D -1 })
+@@ -189,7 +196,9 @@ func (n *node) write(p *page) {
+ 		p.flags |=3D branchPageFlag
+ 	}
+=20
+-	_assert(len(n.inodes) < 0xFFFF, "inode overflow: %d (pgid=3D%d)", len(n.=
inodes), p.id)
++	if len(n.inodes) >=3D 0xFFFF {
++		panic(fmt.Sprintf("inode overflow: %d (pgid=3D%d)", len(n.inodes), p.id=
))
++	}
+ 	p.count =3D uint16(len(n.inodes))
+=20
+ 	// Loop over each item and write it to the page.
+@@ -212,11 +221,20 @@ func (n *node) write(p *page) {
+ 			_assert(elem.pgid !=3D p.id, "write: circular dependency occurred")
+ 		}
+=20
++		// If the length of key+value is larger than the max allocation size
++		// then we need to reallocate the byte array pointer.
++		//
++		// See: https://github.com/boltdb/bolt/pull/335
++		klen, vlen :=3D len(item.key), len(item.value)
++		if len(b) < klen+vlen {
++			b =3D (*[maxAllocSize]byte)(unsafe.Pointer(&b[0]))[:]
++		}
++
+ 		// Write data for the element to the end of the page.
+ 		copy(b[0:], item.key)
+-		b =3D b[len(item.key):]
++		b =3D b[klen:]
+ 		copy(b[0:], item.value)
+-		b =3D b[len(item.value):]
++		b =3D b[vlen:]
+ 	}
+=20
+ 	// DEBUG ONLY: n.dump()
+@@ -348,7 +366,9 @@ func (n *node) spill() error {
+ 		}
+=20
+ 		// Write the node.
+-		_assert(p.id < tx.meta.pgid, "pgid (%d) above high water mark (%d)", p.=
id, tx.meta.pgid)
++		if p.id >=3D tx.meta.pgid {
++			panic(fmt.Sprintf("pgid (%d) above high water mark (%d)", p.id, tx.met=
a.pgid))
++		}
+ 		node.pgid =3D p.id
+ 		node.write(p)
+ 		node.spilled =3D true
+diff --git a/vendor/src/github.com/boltdb/bolt/page.go b/vendor/src/github=
.com/boltdb/bolt/page.go
+index b3dc473..818aa1b 100644
+--- a/vendor/src/github.com/boltdb/bolt/page.go
++++ b/vendor/src/github.com/boltdb/bolt/page.go
+@@ -3,12 +3,12 @@ package bolt
+ import (
+ 	"fmt"
+ 	"os"
++	"sort"
+ 	"unsafe"
+ )
+=20
+ const pageHeaderSize =3D int(unsafe.Offsetof(((*page)(nil)).ptr))
+=20
+-const maxAllocSize =3D 0xFFFFFFF
+ const minKeysPerPage =3D 2
+=20
+ const branchPageElementSize =3D int(unsafe.Sizeof(branchPageElement{}))
+@@ -97,7 +97,7 @@ type branchPageElement struct {
+ // key returns a byte slice of the node key.
+ func (n *branchPageElement) key() []byte {
+ 	buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n))
+-	return buf[n.pos : n.pos+n.ksize]
++	return (*[maxAllocSize]byte)(unsafe.Pointer(&buf[n.pos]))[:n.ksize]
+ }
+=20
+ // leafPageElement represents a node on a leaf page.
+@@ -111,13 +111,13 @@ type leafPageElement struct {
+ // key returns a byte slice of the node key.
+ func (n *leafPageElement) key() []byte {
+ 	buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n))
+-	return buf[n.pos : n.pos+n.ksize]
++	return (*[maxAllocSize]byte)(unsafe.Pointer(&buf[n.pos]))[:n.ksize]
+ }
+=20
+ // value returns a byte slice of the node value.
+ func (n *leafPageElement) value() []byte {
+ 	buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(n))
+-	return buf[n.pos+n.ksize : n.pos+n.ksize+n.vsize]
++	return (*[maxAllocSize]byte)(unsafe.Pointer(&buf[n.pos+n.ksize]))[:n.vsi=
ze]
+ }
+=20
+ // PageInfo represents human readable information about a page.
+@@ -133,3 +133,40 @@ type pgids []pgid
+ func (s pgids) Len() int           { return len(s) }
+ func (s pgids) Swap(i, j int)      { s[i], s[j] =3D s[j], s[i] }
+ func (s pgids) Less(i, j int) bool { return s[i] < s[j] }
++
++// merge returns the sorted union of a and b.
++func (a pgids) merge(b pgids) pgids {
++	// Return the opposite slice if one is nil.
++	if len(a) =3D=3D 0 {
++		return b
++	} else if len(b) =3D=3D 0 {
++		return a
++	}
++
++	// Create a list to hold all elements from both lists.
++	merged :=3D make(pgids, 0, len(a)+len(b))
++
++	// Assign lead to the slice with a lower starting value, follow to the h=
igher value.
++	lead, follow :=3D a, b
++	if b[0] < a[0] {
++		lead, follow =3D b, a
++	}
++
++	// Continue while there are elements in the lead.
++	for len(lead) > 0 {
++		// Merge largest prefix of lead that is ahead of follow[0].
++		n :=3D sort.Search(len(lead), func(i int) bool { return lead[i] > follo=
w[0] })
++		merged =3D append(merged, lead[:n]...)
++		if n >=3D len(lead) {
++			break
++		}
++
++		// Swap lead and follow.
++		lead, follow =3D follow, lead[n:]
++	}
++
++	// Append what's left in follow.
++	merged =3D append(merged, follow...)
++
++	return merged
++}
+diff --git a/vendor/src/github.com/boltdb/bolt/tx.go b/vendor/src/github.c=
om/boltdb/bolt/tx.go
+index c041d73..fe6c287 100644
+--- a/vendor/src/github.com/boltdb/bolt/tx.go
++++ b/vendor/src/github.com/boltdb/bolt/tx.go
+@@ -87,18 +87,21 @@ func (tx *Tx) Stats() TxStats {
+=20
+ // Bucket retrieves a bucket by name.
+ // Returns nil if the bucket does not exist.
++// The bucket instance is only valid for the lifetime of the transaction.
+ func (tx *Tx) Bucket(name []byte) *Bucket {
+ 	return tx.root.Bucket(name)
+ }
+=20
+ // CreateBucket creates a new bucket.
+ // Returns an error if the bucket already exists, if the bucket name is b=
lank, or if the bucket name is too long.
++// The bucket instance is only valid for the lifetime of the transaction.
+ func (tx *Tx) CreateBucket(name []byte) (*Bucket, error) {
+ 	return tx.root.CreateBucket(name)
+ }
+=20
+ // CreateBucketIfNotExists creates a new bucket if it doesn't already exi=
st.
+ // Returns an error if the bucket name is blank, or if the bucket name is=
 too long.
++// The bucket instance is only valid for the lifetime of the transaction.
+ func (tx *Tx) CreateBucketIfNotExists(name []byte) (*Bucket, error) {
+ 	return tx.root.CreateBucketIfNotExists(name)
+ }
+@@ -127,7 +130,8 @@ func (tx *Tx) OnCommit(fn func()) {
+ }
+=20
+ // Commit writes all changes to disk and updates the meta page.
+-// Returns an error if a disk write error occurs.
++// Returns an error if a disk write error occurs, or if Commit is
++// called on a read-only transaction.
+ func (tx *Tx) Commit() error {
+ 	_assert(!tx.managed, "managed tx commit not allowed")
+ 	if tx.db =3D=3D nil {
+@@ -203,7 +207,8 @@ func (tx *Tx) Commit() error {
+ 	return nil
+ }
+=20
+-// Rollback closes the transaction and ignores all previous updates.
++// Rollback closes the transaction and ignores all previous updates. Read=
-only
++// transactions must be rolled back and not committed.
+ func (tx *Tx) Rollback() error {
+ 	_assert(!tx.managed, "managed tx rollback not allowed")
+ 	if tx.db =3D=3D nil {
+@@ -234,7 +239,8 @@ func (tx *Tx) close() {
+ 		var freelistPendingN =3D tx.db.freelist.pending_count()
+ 		var freelistAlloc =3D tx.db.freelist.size()
+=20
+-		// Remove writer lock.
++		// Remove transaction ref & writer lock.
++		tx.db.rwtx =3D nil
+ 		tx.db.rwlock.Unlock()
+=20
+ 		// Merge statistics.
+@@ -248,41 +254,51 @@ func (tx *Tx) close() {
+ 	} else {
+ 		tx.db.removeTx(tx)
+ 	}
++
++	// Clear all references.
+ 	tx.db =3D nil
++	tx.meta =3D nil
++	tx.root =3D Bucket{tx: tx}
++	tx.pages =3D nil
+ }
+=20
+ // Copy writes the entire database to a writer.
+-// A reader transaction is maintained during the copy so it is safe to co=
ntinue
+-// using the database while a copy is in progress.
+-// Copy will write exactly tx.Size() bytes into the writer.
++// This function exists for backwards compatibility. Use WriteTo() in
+ func (tx *Tx) Copy(w io.Writer) error {
+-	var f *os.File
+-	var err error
++	_, err :=3D tx.WriteTo(w)
++	return err
++}
+=20
++// WriteTo writes the entire database to a writer.
++// If err =3D=3D nil then exactly tx.Size() bytes will be written into th=
e writer.
++func (tx *Tx) WriteTo(w io.Writer) (n int64, err error) {
+ 	// Attempt to open reader directly.
++	var f *os.File
+ 	if f, err =3D os.OpenFile(tx.db.path, os.O_RDONLY|odirect, 0); err !=3D =
nil {
+ 		// Fallback to a regular open if that doesn't work.
+ 		if f, err =3D os.OpenFile(tx.db.path, os.O_RDONLY, 0); err !=3D nil {
+-			return err
++			return 0, err
+ 		}
+ 	}
+=20
+ 	// Copy the meta pages.
+ 	tx.db.metalock.Lock()
+-	_, err =3D io.CopyN(w, f, int64(tx.db.pageSize*2))
++	n, err =3D io.CopyN(w, f, int64(tx.db.pageSize*2))
+ 	tx.db.metalock.Unlock()
+ 	if err !=3D nil {
+ 		_ =3D f.Close()
+-		return fmt.Errorf("meta copy: %s", err)
++		return n, fmt.Errorf("meta copy: %s", err)
+ 	}
+=20
+ 	// Copy data pages.
+-	if _, err :=3D io.CopyN(w, f, tx.Size()-int64(tx.db.pageSize*2)); err !=
=3D nil {
++	wn, err :=3D io.CopyN(w, f, tx.Size()-int64(tx.db.pageSize*2))
++	n +=3D wn
++	if err !=3D nil {
+ 		_ =3D f.Close()
+-		return err
++		return n, err
+ 	}
+=20
+-	return f.Close()
++	return n, f.Close()
+ }
+=20
+ // CopyFile copies the entire database to file at the given path.
+@@ -416,15 +432,39 @@ func (tx *Tx) write() error {
+ 	// Write pages to disk in order.
+ 	for _, p :=3D range pages {
+ 		size :=3D (int(p.overflow) + 1) * tx.db.pageSize
+-		buf :=3D (*[maxAllocSize]byte)(unsafe.Pointer(p))[:size]
+ 		offset :=3D int64(p.id) * int64(tx.db.pageSize)
+-		if _, err :=3D tx.db.ops.writeAt(buf, offset); err !=3D nil {
+-			return err
+-		}
+=20
+-		// Update statistics.
+-		tx.stats.Write++
++		// Write out page in "max allocation" sized chunks.
++		ptr :=3D (*[maxAllocSize]byte)(unsafe.Pointer(p))
++		for {
++			// Limit our write to our max allocation size.
++			sz :=3D size
++			if sz > maxAllocSize-1 {
++				sz =3D maxAllocSize - 1
++			}
++
++			// Write chunk to disk.
++			buf :=3D ptr[:sz]
++			if _, err :=3D tx.db.ops.writeAt(buf, offset); err !=3D nil {
++				return err
++			}
++
++			// Update statistics.
++			tx.stats.Write++
++
++			// Exit inner for loop if we've written all the chunks.
++			size -=3D sz
++			if size =3D=3D 0 {
++				break
++			}
++
++			// Otherwise move offset forward and move pointer to next chunk.
++			offset +=3D int64(sz)
++			ptr =3D (*[maxAllocSize]byte)(unsafe.Pointer(&ptr[sz]))
++		}
+ 	}
++
++	// Ignore file sync if flag is set on DB.
+ 	if !tx.db.NoSync || IgnoreNoSync {
+ 		if err :=3D fdatasync(tx.db); err !=3D nil {
+ 			return err
+--=20
+1.9.1
+
diff --git a/recipes-containers/docker/files/disable_sha1sum_startup.patch =
b/recipes-containers/docker/files/disable_sha1sum_startup.patch
index 580ca23..cafd83d 100644
--- a/recipes-containers/docker/files/disable_sha1sum_startup.patch
+++ b/recipes-containers/docker/files/disable_sha1sum_startup.patch
@@ -12,20 +12,23 @@ of the binary instead.
=20
 Signed-off-by: Amy Fong <amy.fong@windriver.com>
 ---
- utils/utils.go |   17 +----------------
- 1 file changed, 1 insertion(+), 16 deletions(-)
+ utils/utils.go | 18 +-----------------
+ 1 file changed, 1 insertion(+), 17 deletions(-)
=20
+diff --git a/utils/utils.go b/utils/utils.go
+index a17ab9d..3fc514a 100644
 --- a/utils/utils.go
 +++ b/utils/utils.go
-@@ -3,7 +3,6 @@
+@@ -2,8 +2,6 @@ package utils
+=20
  import (
  	"bufio"
- 	"bytes"
 -	"crypto/sha1"
- 	"crypto/sha256"
- 	"encoding/hex"
+-	"encoding/hex"
  	"fmt"
-@@ -75,20 +74,6 @@
+ 	"io"
+ 	"io/ioutil"
+@@ -42,20 +40,6 @@ func SelfPath() string {
  	return path
  }
 =20
@@ -46,7 +49,7 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
  func isValidDockerInitPath(target string, selfPath string) bool { // targ=
et and selfPath should be absolute (InitPath and SelfPath already do this)
  	if target =3D=3D "" {
  		return false
-@@ -110,7 +95,7 @@
+@@ -77,7 +61,7 @@ func isValidDockerInitPath(target string, selfPath strin=
g) bool { // target and
  		}
  		return os.SameFile(targetFileInfo, selfPathFileInfo)
  	}
@@ -54,4 +57,4 @@ Signed-off-by: Amy Fong <amy.fong@windriver.com>
 +	return true
  }
 =20
- // Figure out the path of our dockerinit (which may be SelfPath())
+ // DockerInitPath figures out the path of our dockerinit (which may be Se=
lfPath())
--=20
1.8.3.2


