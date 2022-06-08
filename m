Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0217FC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 16:21:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8567.1654705264132750917
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 09:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F159E1424;
	Wed,  8 Jun 2022 09:21:02 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 006A03F73B;
	Wed,  8 Jun 2022 09:21:01 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH] k3s: Fetch dependencies from github
 instead of googlesource to avoid rate-limit
Date: Wed,  8 Jun 2022 17:20:45 +0100
Message-Id: 
 <956614aeb05d3f6377da58e713309ca12e2fffe9.1654704740.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jun 2022 16:21:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7347

All repositories under https://go.googlesource.com/ have a mirror in
https://github.com.

Fetching the dependencies from github is much faster and we avoid timeouts =
due
to googlesource rate-limit.

Reference: https://github.com/golang/go/issues/12933

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-containers/k3s/k3s_git.bb | 62 +++++++++++++++----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s=
_git.bb
index a20092c..4f109ad 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -2238,79 +2238,79 @@ SRCREV_zap=3D"2908d3000567b86f0b7f1e99cc6bc5c9f30d4=
3a0"
 SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org=
/zap"
=20
 # golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
-# [1] git ls-remote https://go.googlesource.com/crypto 5ea612d1eb830b38bc4=
e914e37f55311eb58adce=20
+# [1] git ls-remote https://github.com/golang/crypto 5ea612d1eb830b38bc4e9=
14e37f55311eb58adce=20
 SRCREV_crypto=3D"5ea612d1eb830b38bc4e914e37f55311eb58adce"
-SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/crypto"
+SRC_URI +=3D "git://github.com/golang/crypto;name=3Dcrypto;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/crypto"
=20
 # golang.org/x/exp v0.0.0-20210220032938-85be41e4509f
-# [1] git ls-remote https://go.googlesource.com/exp 85be41e4509f417cbf9900=
6a027aef75deb8afd1=20
+# [1] git ls-remote https://github.com/golang/exp 85be41e4509f417cbf99006a=
027aef75deb8afd1=20
 SRCREV_exp=3D"85be41e4509f417cbf99006a027aef75deb8afd1"
-SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googles=
ource.com/exp"
+SRC_URI +=3D "git://github.com/golang/exp;name=3Dexp;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
olang/exp"
=20
 # golang.org/x/image v0.0.0-20190802002840-cff245a6509b
-# [1] git ls-remote https://go.googlesource.com/image cff245a6509b8c4de022=
d0d5b9037c503c5989d6=20
+# [1] git ls-remote https://github.com/golang/image cff245a6509b8c4de022d0=
d5b9037c503c5989d6=20
 SRCREV_image=3D"cff245a6509b8c4de022d0d5b9037c503c5989d6"
-SRC_URI +=3D "git://go.googlesource.com/image;name=3Dimage;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/image"
+SRC_URI +=3D "git://github.com/golang/image;name=3Dimage;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/image"
=20
 # golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
-# [1] git ls-remote https://go.googlesource.com/lint 6edffad5e6160f5949cde=
fc81710b2706fbcd4f6=20
+# [1] git ls-remote https://github.com/golang/lint 6edffad5e6160f5949cdefc=
81710b2706fbcd4f6=20
 SRCREV_lint=3D"6edffad5e6160f5949cdefc81710b2706fbcd4f6"
-SRC_URI +=3D "git://go.googlesource.com/lint;name=3Dlint;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/lint"
+SRC_URI +=3D "git://github.com/golang/lint;name=3Dlint;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/golang/lint"
=20
 # golang.org/x/mobile v0.0.0-20201217150744-e6ae53a27f4f
-# [1] git ls-remote https://go.googlesource.com/mobile e6ae53a27f4fd7cfa29=
43f2ae47b96cba8eb01c9=20
+# [1] git ls-remote https://github.com/golang/mobile e6ae53a27f4fd7cfa2943=
f2ae47b96cba8eb01c9=20
 SRCREV_mobile=3D"e6ae53a27f4fd7cfa2943f2ae47b96cba8eb01c9"
-SRC_URI +=3D "git://go.googlesource.com/mobile;name=3Dmobile;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/mobile"
+SRC_URI +=3D "git://github.com/golang/mobile;name=3Dmobile;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/mobile"
=20
 # golang.org/x/mod v0.5.1
-# [1] git ls-remote https://go.googlesource.com/mod 49f84bccfd3469cb309520=
1f7855641bcc8eb49a=20
+# [1] git ls-remote https://github.com/golang/mod 49f84bccfd3469cb3095201f=
7855641bcc8eb49a=20
 SRCREV_mod=3D"49f84bccfd3469cb3095201f7855641bcc8eb49a"
-SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googles=
ource.com/mod"
+SRC_URI +=3D "git://github.com/golang/mod;name=3Dmod;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
olang/mod"
=20
 # golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4
-# [1] git ls-remote https://go.googlesource.com/net a5a99cb37ef4b68617775a=
b669177656090ab396=20
+# [1] git ls-remote https://github.com/golang/net a5a99cb37ef4b68617775ab6=
69177656090ab396=20
 SRCREV_net=3D"a5a99cb37ef4b68617775ab669177656090ab396"
-SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googles=
ource.com/net"
+SRC_URI +=3D "git://github.com/golang/net;name=3Dnet;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
olang/net"
=20
 # golang.org/x/oauth2 v0.0.0-20211104180415-d3ed0bb246c8
-# [1] git ls-remote https://go.googlesource.com/oauth2 d3ed0bb246c8d3c75b6=
3937d9a5eecff9c74d7fe=20
+# [1] git ls-remote https://github.com/golang/oauth2 d3ed0bb246c8d3c75b639=
37d9a5eecff9c74d7fe=20
 SRCREV_oauth2=3D"d3ed0bb246c8d3c75b63937d9a5eecff9c74d7fe"
-SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/oauth2"
+SRC_URI +=3D "git://github.com/golang/oauth2;name=3Doauth2;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/oauth2"
=20
 # golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
-# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf193dd=
5a34e034151da389d09=20
+# [1] git ls-remote https://github.com/golang/sync 036812b2e83c0ddf193dd5a=
34e034151da389d09=20
 SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
-SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/sync"
+SRC_URI +=3D "git://github.com/golang/sync;name=3Dsync;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/golang/sync"
=20
 # golang.org/x/sys v0.0.0-20210831042530-f4d43177bf5e
-# [1] git ls-remote https://go.googlesource.com/sys f4d43177bf5e2ee9861795=
6e417d0555d4b69c17=20
+# [1] git ls-remote https://github.com/golang/sys f4d43177bf5e2ee98617956e=
417d0555d4b69c17=20
 SRCREV_sys=3D"f4d43177bf5e2ee98617956e417d0555d4b69c17"
-SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googles=
ource.com/sys"
+SRC_URI +=3D "git://github.com/golang/sys;name=3Dsys;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
olang/sys"
=20
 # golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d
-# [1] git ls-remote https://go.googlesource.com/term 6a3ed077a48de71621ad5=
30f9078fffa0bc0ce32=20
+# [1] git ls-remote https://github.com/golang/term 6a3ed077a48de71621ad530=
f9078fffa0bc0ce32=20
 SRCREV_term1=3D"6a3ed077a48de71621ad530f9078fffa0bc0ce32"
-SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm1;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goog=
lesource.com/term"
+SRC_URI +=3D "git://github.com/golang/term;name=3Dterm1;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/golang/term"
=20
 # golang.org/x/text v0.3.7
-# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883d229d=
707172ed356727aae99=20
+# [1] git ls-remote https://github.com/golang/text 3cd4007149f3f883d229d70=
7172ed356727aae99=20
 SRCREV_text1=3D"3cd4007149f3f883d229d707172ed356727aae99"
-SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext1;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goog=
lesource.com/text"
+SRC_URI +=3D "git://github.com/golang/text;name=3Dtext1;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/golang/text"
=20
 # golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
-# [1] git ls-remote https://go.googlesource.com/time 1f47c861a9ac5a6e76456=
09f91b895398ff31642=20
+# [1] git ls-remote https://github.com/golang/time 1f47c861a9ac5a6e7645609=
f91b895398ff31642=20
 SRCREV_time=3D"1f47c861a9ac5a6e7645609f91b895398ff31642"
-SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/time"
+SRC_URI +=3D "git://github.com/golang/time;name=3Dtime;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/golang/time"
=20
 # golang.org/x/tools v0.1.8
-# [1] git ls-remote https://go.googlesource.com/tools e212aff8fd146c44ddb0=
167c1dfbd5531d6c9213=20
+# [1] git ls-remote https://github.com/golang/tools e212aff8fd146c44ddb016=
7c1dfbd5531d6c9213=20
 SRCREV_tools=3D"e212aff8fd146c44ddb0167c1dfbd5531d6c9213"
-SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/tools"
+SRC_URI +=3D "git://github.com/golang/tools;name=3Dtools;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/tools"
=20
 # golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
-# [1] git ls-remote https://go.googlesource.com/xerrors 5ec99f83aff198f5fb=
d629d6c8d8eb38a04218ca=20
+# [1] git ls-remote https://github.com/golang/xerrors 5ec99f83aff198f5fbd6=
29d6c8d8eb38a04218ca=20
 SRCREV_xerrors=3D"5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
-SRC_URI +=3D "git://go.googlesource.com/xerrors;name=3Dxerrors;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/xerrors"
+SRC_URI +=3D "git://github.com/golang/xerrors;name=3Dxerrors;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/xerrors"
=20
 # golang.zx2c4.com/go118/netip v0.0.0-20211111135330-a4a02eeacf9d
 # [1] git ls-remote https://git.zx2c4.com/go118-netip a4a02eeacf9d49566df8=
5e8cff878e5527e51779=20
@@ -2633,7 +2633,7 @@ do_compile() {
=20
         cd ${S}/src/import
=20
-        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.org/bertim=
us9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/go:githu=
b.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:github.com/go=
ogleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/datastore:g=
ithub.com/googleapis/google-cloud-go/bigquery//datastore cloud.google.com/g=
o/firestore:github.com/googleapis/google-cloud-go/bigquery//firestore cloud=
.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquery//pubsu=
b cloud.google.com/go/storage:github.com/googleapis/google-cloud-go/bigquer=
y//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mtl github=
.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skylar/exceli=
ze github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for-go gith=
ub.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Azure/go-a=
utorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/autorest:=
github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go-autores=
t/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/adal github=
.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/autorest/=
/autorest/date github.com/Azure/go-autorest/autorest/mocks:github.com/Azure=
/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/autorest=
/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/Azure/go-=
autorest/autorest/validation:github.com/Azure/go-autorest/autorest//autores=
t/validation github.com/Azure/go-autorest/logger:github.com/Azure/go-autore=
st/autorest//logger github.com/Azure/go-autorest/tracing:github.com/Azure/g=
o-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/BurntSus=
hi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.com/Goog=
leCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k8s-cloud=
-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_pdh githu=
b.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com/Microso=
ft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcsshim:gith=
ub.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/NYTimes/=
gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash github.co=
m/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/PuerkitoBio=
/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc:github.=
com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/retry gith=
ub.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.com/ajst=
arks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:github.co=
m/alecthomas/template github.com/alecthomas/units:github.com/alecthomas/uni=
ts github.com/alexflint/go-filemutex:github.com/alexflint/go-filemutex gith=
ub.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalholm/casc=
adia:github.com/andybalholm/cascadia github.com/antihax/optional:github.com=
/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf github.=
com/armon/consul-api:github.com/armon/consul-api github.com/armon/go-metric=
s:github.com/armon/go-metrics github.com/armon/go-radix:github.com/armon/go=
-radix github.com/asaskevich/govalidator:github.com/asaskevich/govalidator =
github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middleware githu=
b.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohnson/clock=
:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/beorn7/per=
ks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github.com/bit=
s-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bketelsen/=
crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com/blang/s=
emver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bronze1man/g=
oStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/buger/jso=
nparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:github.c=
om/canonical/go-dqlite github.com/census-instrumentation/opencensus-proto:g=
ithub.com/census-instrumentation/opencensus-proto github.com/certifi/gocert=
ifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.com/cespa=
re/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 github.=
com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/checkpoin=
t-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 github.com/ch=
eggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com/chzyer/=
logex github.com/chzyer/readline:github.com/chzyer/readline github.com/chzy=
er/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/cilium/ebp=
f github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs/kube-ro=
uter github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-go github=
.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachdb/datadr=
iven:github.com/cockroachdb/datadriven github.com/cockroachdb/errors:github=
.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/cockroach=
db/logtags github.com/container-storage-interface/spec:github.com/container=
-storage-interface/spec github.com/containerd/aufs:github.com/containerd/au=
fs github.com/containerd/btrfs:github.com/containerd/btrfs github.com/conta=
inerd/cgroups:github.com/containerd/cgroups github.com/containerd/console:g=
ithub.com/containerd/console github.com/containerd/containerd:github.com/co=
ntainerd/containerd github.com/containerd/continuity:github.com/containerd/=
continuity github.com/containerd/fifo:github.com/containerd/fifo github.com=
/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-overlayfs=
-snapshotter github.com/containerd/go-cni:github.com/containerd/go-cni gith=
ub.com/containerd/go-runc:github.com/containerd/go-runc github.com/containe=
rd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nri:github=
.com/containerd/nri github.com/containerd/stargz-snapshotter:github.com/con=
tainerd/stargz-snapshotter github.com/containerd/stargz-snapshotter/estargz=
:github.com/containerd/stargz-snapshotter//estargz github.com/containerd/tt=
rpc:github.com/containerd/ttrpc github.com/containerd/typeurl:github.com/co=
ntainerd/typeurl github.com/containerd/zfs:github.com/containerd/zfs github=
.com/containernetworking/cni:github.com/containernetworking/cni github.com/=
containernetworking/plugins:github.com/containernetworking/plugins github.c=
om/containers/ocicrypt:github.com/containers/ocicrypt github.com/coredns/ca=
ddy:github.com/coredns/caddy github.com/coredns/corefile-migration:github.c=
om/coredns/corefile-migration github.com/coreos/bbolt:github.com/coreos/bbo=
lt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/go-iptab=
les:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.com/core=
os/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver github.c=
om/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos/go-syst=
emd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:github.com/c=
oreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-md2man/v2=
 github.com/creack/pty:github.com/creack/pty github.com/cyphar/filepath-sec=
urejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:github.c=
om/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client github.c=
om/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardwareaddr:g=
ithub.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com/danielj=
oos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew github.co=
m/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext github.com/d=
enverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrijalva/jwt-=
go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.com/dgrysk=
i/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 github.co=
m/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:github.com/d=
ocker/cli github.com/docker/distribution:github.com/docker/distribution git=
hub.com/docker/docker:github.com/docker/docker github.com/docker/docker-cre=
dential-helpers:github.com/docker/docker-credential-helpers github.com/dock=
er/go-connections:github.com/docker/go-connections github.com/docker/go-eve=
nts:github.com/docker/go-events github.com/docker/go-metrics:github.com/doc=
ker/go-metrics github.com/docker/go-units:github.com/docker/go-units github=
.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin/go-huma=
nize:github.com/dustin/go-humanize github.com/dustmop/soup:github.com/dustm=
op/soup github.com/eapache/channels:github.com/eapache/channels github.com/=
eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:github.co=
m/elazarl/goproxy github.com/emicklei/go-restful:github.com/emicklei/go-res=
tful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/go-contro=
l-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoyproxy/pro=
toc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubbelboer/g=
spt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser github.=
com/evanphx/json-patch:github.com/evanphx/json-patch github.com/exponent-io=
/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-promise:git=
hub.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fatih/came=
lcase github.com/fatih/color:github.com/fatih/color github.com/felixge/http=
snoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:github.com=
/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-shlex git=
hub.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss/jwt-go:=
github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:github.com/fr=
ankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/fsnotify =
github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.com/gets=
entry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml:github.=
com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo github.=
com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.com/go-er=
rors/errors:github.com/go-errors/errors github.com/go-gl/glfw:github.com/go=
-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3/glfw//v=
3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-kit/kit:=
github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log github.co=
m/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/logr:gith=
ub.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr github.=
com/go-openapi/analysis:github.com/go-openapi/analysis github.com/go-openap=
i/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpointer:git=
hub.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:github.c=
om/go-openapi/jsonreference github.com/go-openapi/loads:github.com/go-opena=
pi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtime github=
.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-openapi/strfm=
t:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.com/go-ope=
napi/swag github.com/go-openapi/validate:github.com/go-openapi/validate git=
hub.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation github.c=
om/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go-stack/s=
tack:github.com/go-stack/stack github.com/go-task/slim-sprig:github.com/go-=
task/slim-sprig github.com/go-test/deep:github.com/go-test/deep github.com/=
goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:github.com/go=
dbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.com/go=
frs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/gofrs/uui=
d github.com/gogo/googleapis:github.com/gogo/googleapis github.com/gogo/pro=
tobuf:github.com/gogo/protobuf github.com/golang/freetype:github.com/golang=
/freetype github.com/golang/glog:github.com/golang/glog github.com/golang/g=
roupcache:github.com/golang/groupcache github.com/golang/mock:github.com/go=
lang/mock github.com/golang/protobuf:github.com/golang/protobuf github.com/=
golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:github.c=
om/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus/fmt git=
hub.com/golangplus/testing:github.com/golangplus/testing github.com/google/=
btree:github.com/google/btree github.com/google/cadvisor:github.com/google/=
cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.com/googl=
e/go-containerregistry:github.com/google/go-containerregistry github.com/go=
ogle/gofuzz:github.com/google/gofuzz github.com/google/martian:github.com/g=
oogle/martian github.com/google/martian/v3:github.com/google/martian/v3 git=
hub.com/google/pprof:github.com/google/pprof github.com/google/renameio:git=
hub.com/google/renameio github.com/google/shlex:github.com/google/shlex git=
hub.com/google/uuid:github.com/google/uuid github.com/googleapis/gax-go/v2:=
github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:github.co=
m/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/gophercl=
oud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/gopherjs g=
ithub.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/websocket:g=
ithub.com/gorilla/websocket github.com/gregjones/httpcache:github.com/gregj=
ones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.com/grpc=
-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-prometheus:=
github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosystem/grpc=
-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/go-fuse/v=
2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:github.com/h=
ashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com/hashico=
rp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicorp/errwra=
p github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp githu=
b.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/hashicorp=
/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.com/hash=
icorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashicorp/go-mu=
ltierror:github.com/hashicorp/go-multierror github.com/hashicorp/go-retryab=
lehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/go-rootce=
rts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-sockaddr:gith=
ub.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.com/hash=
icorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/go-uuid g=
ithub.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/hashicorp=
/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hcl:github=
.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashicorp/logut=
ils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/hashicor=
p/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/serf:gith=
ub.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/heketi git=
hub.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tail:github=
.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelgupf/sock=
etpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor/demangl=
e github.com/imdario/mergo:github.com/imdario/mergo github.com/inconshrevea=
ble/mousetrap:github.com/inconshreveable/mousetrap github.com/insomniacslk/=
dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:github.com/i=
shidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping github.c=
om/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespath/go-jm=
espath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmespath/inte=
rnal/testify:github.com/jmespath/go-jmespath/internal/testify//internal/tes=
tify github.com/joho/godotenv:github.com/joho/godotenv github.com/jonboulle=
/clockwork:github.com/jonboulle/clockwork github.com/josharian/intern:githu=
b.com/josharian/intern github.com/josharian/native:github.com/josharian/nat=
ive github.com/jpillora/backoff:github.com/jpillora/backoff github.com/jsim=
onetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-iterator/g=
o:github.com/json-iterator/go github.com/jstemmer/go-junit-report:github.co=
m/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/gls gith=
ub.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter github.=
com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/critbitg=
o:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:github.com/=
k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kine github=
.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisielk/errc=
heck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.com/kisie=
lk/gotool github.com/klauspost/compress:github.com/klauspost/compress githu=
b.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsorten/go-wi=
ndows-terminal-sequences:github.com/konsorten/go-windows-terminal-sequences=
 github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/kr/logfm=
t github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:github.com/kr=
/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-sigs/cri-t=
ools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/godebug:git=
hub.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq github.com/l=
ibopenstorage/openstorage:github.com/libopenstorage/openstorage github.com/=
liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer/dedent:=
github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpabon/godbc=
 github.com/magiconair/properties:github.com/magiconair/properties github.c=
om/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-colorable=
:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.com/mattn/=
go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewidth githu=
b.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com/mattn/g=
o-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_protobuf=
_extensions:github.com/matttproud/golang_protobuf_extensions github.com/mdl=
ayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/ethtool:git=
hub.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/mdlayher/=
genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink github.co=
m/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:github.co=
m/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.com/miek=
g/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.com/mikioh=
/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml github.co=
m/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-go/v7:git=
hub.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/minio/sha=
256-simd github.com/minio/sio:github.com/minio/sio github.com/mistifyio/go-=
zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com/mitchel=
lh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir gith=
ub.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testing-inter=
face github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordwrap gith=
ub.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/iochan:g=
ithub.com/mitchellh/iochan github.com/mitchellh/mapstructure:github.com/mit=
chellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs github.com/mo=
by/locker:github.com/moby/locker github.com/moby/spdystream:github.com/moby=
/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo//mo=
untinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//symlink =
github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:github.com=
/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/concurren=
t github.com/modern-go/reflect2:github.com/modern-go/reflect2 github.com/mo=
hae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go-gitigno=
re:github.com/monochromegane/go-gitignore github.com/morikuni/aec:github.co=
m/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fileutils gi=
thub.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/mvdan/xu=
rls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.com/mwitk=
ow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowrate githu=
b.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.com/nieme=
yer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.com/nxad=
m/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/olekukonko/ta=
blewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:github.c=
om/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github.com/ope=
ncontainers/go-digest:github.com/opencontainers/go-digest github.com/openco=
ntainers/image-spec:github.com/opencontainers/image-spec github.com/opencon=
tainers/runc:github.com/opencontainers/runc github.com/opencontainers/runti=
me-spec:github.com/opencontainers/runtime-spec github.com/opencontainers/se=
linux:github.com/opencontainers/selinux github.com/opentracing/opentracing-=
go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:github.com/o=
srg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.com/otiai1=
0/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/otiai10/m=
int github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.com/paul=
mach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com/pborman=
/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-buffruneio=
 github.com/pelletier/go-toml:github.com/pelletier/go-toml github.com/peter=
bourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:github.c=
om/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.com/pkg/s=
ftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pmezard/go=
-difflib github.com/posener/complete:github.com/posener/complete github.com=
/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/prometheus=
/client_golang:github.com/prometheus/client_golang github.com/prometheus/cl=
ient_model:github.com/prometheus/client_model github.com/prometheus/common:=
github.com/prometheus/common github.com/prometheus/procfs:github.com/promet=
heus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb github.co=
m/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:github.co=
m/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher/dynamic=
listener github.com/rancher/lasso:github.com/rancher/lasso github.com/ranch=
er/remotedialer:github.com/rancher/remotedialer github.com/rancher/wharfie:=
github.com/rancher/wharfie github.com/rancher/wrangler:github.com/rancher/w=
rangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/bigfft g=
ithub.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpeppe/fast=
uuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:github.co=
m/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:github.co=
m/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/xid githu=
b.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/blackfri=
day:github.com/russross/blackfriday github.com/russross/blackfriday/v2:gith=
ub.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github.com/rya=
nuber/columnize github.com/safchain/ethtool:github.com/safchain/ethtool git=
hub.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/seed:gith=
ub.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/seccomp/l=
ibseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff github.c=
om/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_anchor_name=
 github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/smartystr=
eets/assertions:github.com/smartystreets/assertions github.com/smartystreet=
s/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cmux:githu=
b.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/water githu=
b.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf13/afero=
:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast github.=
com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweatherman:g=
ithub.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com/spf13/p=
flag github.com/spf13/viper:github.com/spf13/viper github.com/stefanberger/=
go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewer/go-str=
case:github.com/stoewer/go-strcase github.com/storageos/go-api:github.com/s=
torageos/go-api github.com/stretchr/objx:github.com/stretchr/objx github.co=
m/stretchr/testify:github.com/stretchr/testify github.com/subosito/gotenv:g=
ithub.com/subosito/gotenv github.com/syndtr/gocapability:github.com/syndtr/=
gocapability github.com/tchap/go-patricia:github.com/tchap/go-patricia gith=
ub.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/tencentclou=
d-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github.com/tmc=
/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.com/u-root=
/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ugorji/go =
github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v2:github=
.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negroni gith=
ub.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vektah/gqlpa=
rser:github.com/vektah/gqlparser github.com/vishvananda/netlink:github.com/=
vishvananda/netlink github.com/vishvananda/netns:github.com/vishvananda/net=
ns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/willf/bit=
set:github.com/willf/bitset github.com/xiang90/probing:github.com/xiang90/p=
robing github.com/xlab/treeprint:github.com/xlab/treeprint github.com/xorda=
taexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/goldmark:=
github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.io/etcd:=
go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/clien=
t/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/etcd/clie=
nt/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/client/pkg/=
v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/v3//raft=
 go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.io/etcd/=
client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/etcdutl/=
v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3:github.=
com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/pkcs7 go=
.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.opentelemetr=
y.io/contrib go.opentelemetry.io/contrib/instrumentation/google.golang.org/=
grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.golang.or=
g/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/http/otelht=
tp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp go.opente=
lemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/exporters=
/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/otel/met=
ric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/oteltest:go.o=
pentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.opentelemetr=
y.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.opentelemetry.=
io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.opentelem=
etry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opentelemetry.io=
/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemetry/opent=
elemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/starlark-go =
go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.org/goleak=
 go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.org/zap =
golang.org/x/crypto:go.googlesource.com/crypto golang.org/x/exp:go.googleso=
urce.com/exp golang.org/x/image:go.googlesource.com/image golang.org/x/lint=
:go.googlesource.com/lint golang.org/x/mobile:go.googlesource.com/mobile go=
lang.org/x/mod:go.googlesource.com/mod golang.org/x/net:go.googlesource.com=
/net golang.org/x/oauth2:go.googlesource.com/oauth2 golang.org/x/sync:go.go=
oglesource.com/sync golang.org/x/sys:go.googlesource.com/sys golang.org/x/t=
erm:go.googlesource.com/term golang.org/x/text:go.googlesource.com/text gol=
ang.org/x/time:go.googlesource.com/time golang.org/x/tools:go.googlesource.=
com/tools golang.org/x/xerrors:go.googlesource.com/xerrors golang.zx2c4.com=
/go118/netip:golang.zx2c4.com/go118/netip golang.zx2c4.com/wintun:golang.zx=
2c4.com/wintun golang.zx2c4.com/wireguard:golang.zx2c4.com/wireguard golang=
.zx2c4.com/wireguard/wgctrl:golang.zx2c4.com/wireguard/wgctrl gonum.org/v1/=
gonum:github.com/gonum/gonum gonum.org/v1/netlib:github.com/gonum/netlib go=
num.org/v1/plot:github.com/gonum/plot google.golang.org/api:google.golang.o=
rg/api google.golang.org/appengine:google.golang.org/appengine google.golan=
g.org/genproto:google.golang.org/genproto google.golang.org/grpc:google.gol=
ang.org/grpc google.golang.org/grpc/cmd/protoc-gen-go-grpc:google.golang.or=
g/grpc/cmd/protoc-gen-go-grpc google.golang.org/protobuf:google.golang.org/=
protobuf gopkg.in/airbrake/gobrake.v2:gopkg.in/airbrake/gobrake.v2 gopkg.in=
/alecthomas/kingpin.v2:gopkg.in/alecthomas/kingpin.v2 gopkg.in/check.v1:gop=
kg.in/check.v1 gopkg.in/cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in/err=
go.v2:gopkg.in/errgo.v2 gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg.in/=
gcfg.v1:gopkg.in/gcfg.v1 gopkg.in/gemnasium/logrus-airbrake-hook.v2:gopkg.i=
n/gemnasium/logrus-airbrake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gopkg.i=
n/ini.v1:gopkg.in/ini.v1 gopkg.in/natefinch/lumberjack.v2:gopkg.in/natefinc=
h/lumberjack.v2 gopkg.in/resty.v1:gopkg.in/resty.v1 gopkg.in/square/go-jose=
.v2:gopkg.in/square/go-jose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.in/w=
arnings.v0:gopkg.in/warnings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg.in/=
yaml.v3:gopkg.in/yaml.v3 gotest.tools:gotest.tools gotest.tools/v3:github.c=
om/gotestyourself/gotest.tools/v3 honnef.co/go/tools:honnef.co/go/tools ine=
t.af/tcpproxy:inet.af/tcpproxy k8s.io/api:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/api k8s.io/apiextensions-apiserver:g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/apie=
xtensions-apiserver k8s.io/apimachinery:github.com/k3s-io/kubernetes/stagin=
g/src/k8s.io/api//staging/src/k8s.io/apimachinery k8s.io/apiserver:github.c=
om/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/apiserver k=
8s.io/cli-runtime:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//stag=
ing/src/k8s.io/cli-runtime k8s.io/client-go:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/client-go k8s.io/cloud-provider:gi=
thub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cloud=
-provider k8s.io/cluster-bootstrap:github.com/k3s-io/kubernetes/staging/src=
/k8s.io/api//staging/src/k8s.io/cluster-bootstrap k8s.io/code-generator:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/code-g=
enerator k8s.io/component-base:github.com/k3s-io/kubernetes/staging/src/k8s=
.io/api//staging/src/k8s.io/component-base k8s.io/component-helpers:github.=
com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/component-=
helpers k8s.io/controller-manager:github.com/k3s-io/kubernetes/staging/src/=
k8s.io/api//staging/src/k8s.io/controller-manager k8s.io/cri-api:github.com=
/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cri-api k8s.i=
o/csi-translation-lib:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//=
staging/src/k8s.io/csi-translation-lib k8s.io/kube-aggregator:github.com/k3=
s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-aggregator =
k8s.io/kube-controller-manager:github.com/k3s-io/kubernetes/staging/src/k8s=
.io/api//staging/src/k8s.io/kube-controller-manager k8s.io/kube-proxy:githu=
b.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-pro=
xy k8s.io/kube-scheduler:github.com/k3s-io/kubernetes/staging/src/k8s.io/ap=
i//staging/src/k8s.io/kube-scheduler k8s.io/kubectl:github.com/k3s-io/kuber=
netes/staging/src/k8s.io/api//staging/src/k8s.io/kubectl k8s.io/kubelet:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kubele=
t k8s.io/kubernetes:github.com/k3s-io/kubernetes/staging/src/k8s.io/api k8s=
.io/legacy-cloud-providers:github.com/k3s-io/kubernetes/staging/src/k8s.io/=
api//staging/src/k8s.io/legacy-cloud-providers k8s.io/metrics:github.com/k3=
s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/metrics k8s.io/m=
ount-utils:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src=
/k8s.io/mount-utils k8s.io/pod-security-admission:github.com/k3s-io/kuberne=
tes/staging/src/k8s.io/api//staging/src/k8s.io/pod-security-admission k8s.i=
o/sample-apiserver:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//sta=
ging/src/k8s.io/sample-apiserver k8s.io/gengo:k8s.io/gengo k8s.io/klog:k8s.=
io/klog k8s.io/klog/v2:github.com/k3s-io/klog/v2 k8s.io/kube-openapi:k8s.io=
/kube-openapi k8s.io/system-validators:k8s.io/system-validators k8s.io/util=
s:k8s.io/utils modernc.org/cc:modernc.org/cc modernc.org/golex:modernc.org/=
golex modernc.org/mathutil:modernc.org/mathutil modernc.org/strutil:modernc=
.org/strutil modernc.org/xc:modernc.org/xc rsc.io/binaryregexp:rsc.io/binar=
yregexp rsc.io/pdf:rsc.io/pdf rsc.io/quote/v3:github.com/rsc/quote/v3//v3 r=
sc.io/sampler:rsc.io/sampler sigs.k8s.io/apiserver-network-proxy/konnectivi=
ty-client:github.com/kubernetes-sigs/apiserver-network-proxy/konnectivity-c=
lient//konnectivity-client sigs.k8s.io/cli-utils:sigs.k8s.io/cli-utils sigs=
.k8s.io/controller-runtime:sigs.k8s.io/controller-runtime sigs.k8s.io/kusto=
mize/api:github.com/kubernetes-sigs/kustomize/api//api sigs.k8s.io/kustomiz=
e/cmd/config:github.com/kubernetes-sigs/kustomize/api//cmd/config sigs.k8s.=
io/kustomize/kustomize/v4:github.com/kubernetes-sigs/kustomize/api//kustomi=
ze sigs.k8s.io/kustomize/kyaml:github.com/kubernetes-sigs/kustomize/api//ky=
aml sigs.k8s.io/structured-merge-diff/v4:github.com/kubernetes-sigs/structu=
red-merge-diff/v4 sigs.k8s.io/testing_frameworks:sigs.k8s.io/testing_framew=
orks sigs.k8s.io/yaml:sigs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/json"
+        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.org/bertim=
us9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/go:githu=
b.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:github.com/go=
ogleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/datastore:g=
ithub.com/googleapis/google-cloud-go/bigquery//datastore cloud.google.com/g=
o/firestore:github.com/googleapis/google-cloud-go/bigquery//firestore cloud=
.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquery//pubsu=
b cloud.google.com/go/storage:github.com/googleapis/google-cloud-go/bigquer=
y//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mtl github=
.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skylar/exceli=
ze github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for-go gith=
ub.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Azure/go-a=
utorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/autorest:=
github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go-autores=
t/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/adal github=
.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/autorest/=
/autorest/date github.com/Azure/go-autorest/autorest/mocks:github.com/Azure=
/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/autorest=
/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/Azure/go-=
autorest/autorest/validation:github.com/Azure/go-autorest/autorest//autores=
t/validation github.com/Azure/go-autorest/logger:github.com/Azure/go-autore=
st/autorest//logger github.com/Azure/go-autorest/tracing:github.com/Azure/g=
o-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/BurntSus=
hi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.com/Goog=
leCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k8s-cloud=
-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_pdh githu=
b.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com/Microso=
ft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcsshim:gith=
ub.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/NYTimes/=
gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash github.co=
m/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/PuerkitoBio=
/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc:github.=
com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/retry gith=
ub.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.com/ajst=
arks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:github.co=
m/alecthomas/template github.com/alecthomas/units:github.com/alecthomas/uni=
ts github.com/alexflint/go-filemutex:github.com/alexflint/go-filemutex gith=
ub.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalholm/casc=
adia:github.com/andybalholm/cascadia github.com/antihax/optional:github.com=
/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf github.=
com/armon/consul-api:github.com/armon/consul-api github.com/armon/go-metric=
s:github.com/armon/go-metrics github.com/armon/go-radix:github.com/armon/go=
-radix github.com/asaskevich/govalidator:github.com/asaskevich/govalidator =
github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middleware githu=
b.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohnson/clock=
:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/beorn7/per=
ks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github.com/bit=
s-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bketelsen/=
crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com/blang/s=
emver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bronze1man/g=
oStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/buger/jso=
nparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:github.c=
om/canonical/go-dqlite github.com/census-instrumentation/opencensus-proto:g=
ithub.com/census-instrumentation/opencensus-proto github.com/certifi/gocert=
ifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.com/cespa=
re/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 github.=
com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/checkpoin=
t-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 github.com/ch=
eggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com/chzyer/=
logex github.com/chzyer/readline:github.com/chzyer/readline github.com/chzy=
er/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/cilium/ebp=
f github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs/kube-ro=
uter github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-go github=
.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachdb/datadr=
iven:github.com/cockroachdb/datadriven github.com/cockroachdb/errors:github=
.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/cockroach=
db/logtags github.com/container-storage-interface/spec:github.com/container=
-storage-interface/spec github.com/containerd/aufs:github.com/containerd/au=
fs github.com/containerd/btrfs:github.com/containerd/btrfs github.com/conta=
inerd/cgroups:github.com/containerd/cgroups github.com/containerd/console:g=
ithub.com/containerd/console github.com/containerd/containerd:github.com/co=
ntainerd/containerd github.com/containerd/continuity:github.com/containerd/=
continuity github.com/containerd/fifo:github.com/containerd/fifo github.com=
/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-overlayfs=
-snapshotter github.com/containerd/go-cni:github.com/containerd/go-cni gith=
ub.com/containerd/go-runc:github.com/containerd/go-runc github.com/containe=
rd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nri:github=
.com/containerd/nri github.com/containerd/stargz-snapshotter:github.com/con=
tainerd/stargz-snapshotter github.com/containerd/stargz-snapshotter/estargz=
:github.com/containerd/stargz-snapshotter//estargz github.com/containerd/tt=
rpc:github.com/containerd/ttrpc github.com/containerd/typeurl:github.com/co=
ntainerd/typeurl github.com/containerd/zfs:github.com/containerd/zfs github=
.com/containernetworking/cni:github.com/containernetworking/cni github.com/=
containernetworking/plugins:github.com/containernetworking/plugins github.c=
om/containers/ocicrypt:github.com/containers/ocicrypt github.com/coredns/ca=
ddy:github.com/coredns/caddy github.com/coredns/corefile-migration:github.c=
om/coredns/corefile-migration github.com/coreos/bbolt:github.com/coreos/bbo=
lt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/go-iptab=
les:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.com/core=
os/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver github.c=
om/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos/go-syst=
emd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:github.com/c=
oreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-md2man/v2=
 github.com/creack/pty:github.com/creack/pty github.com/cyphar/filepath-sec=
urejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:github.c=
om/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client github.c=
om/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardwareaddr:g=
ithub.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com/danielj=
oos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew github.co=
m/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext github.com/d=
enverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrijalva/jwt-=
go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.com/dgrysk=
i/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 github.co=
m/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:github.com/d=
ocker/cli github.com/docker/distribution:github.com/docker/distribution git=
hub.com/docker/docker:github.com/docker/docker github.com/docker/docker-cre=
dential-helpers:github.com/docker/docker-credential-helpers github.com/dock=
er/go-connections:github.com/docker/go-connections github.com/docker/go-eve=
nts:github.com/docker/go-events github.com/docker/go-metrics:github.com/doc=
ker/go-metrics github.com/docker/go-units:github.com/docker/go-units github=
.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin/go-huma=
nize:github.com/dustin/go-humanize github.com/dustmop/soup:github.com/dustm=
op/soup github.com/eapache/channels:github.com/eapache/channels github.com/=
eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:github.co=
m/elazarl/goproxy github.com/emicklei/go-restful:github.com/emicklei/go-res=
tful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/go-contro=
l-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoyproxy/pro=
toc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubbelboer/g=
spt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser github.=
com/evanphx/json-patch:github.com/evanphx/json-patch github.com/exponent-io=
/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-promise:git=
hub.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fatih/came=
lcase github.com/fatih/color:github.com/fatih/color github.com/felixge/http=
snoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:github.com=
/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-shlex git=
hub.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss/jwt-go:=
github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:github.com/fr=
ankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/fsnotify =
github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.com/gets=
entry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml:github.=
com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo github.=
com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.com/go-er=
rors/errors:github.com/go-errors/errors github.com/go-gl/glfw:github.com/go=
-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3/glfw//v=
3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-kit/kit:=
github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log github.co=
m/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/logr:gith=
ub.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr github.=
com/go-openapi/analysis:github.com/go-openapi/analysis github.com/go-openap=
i/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpointer:git=
hub.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:github.c=
om/go-openapi/jsonreference github.com/go-openapi/loads:github.com/go-opena=
pi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtime github=
.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-openapi/strfm=
t:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.com/go-ope=
napi/swag github.com/go-openapi/validate:github.com/go-openapi/validate git=
hub.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation github.c=
om/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go-stack/s=
tack:github.com/go-stack/stack github.com/go-task/slim-sprig:github.com/go-=
task/slim-sprig github.com/go-test/deep:github.com/go-test/deep github.com/=
goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:github.com/go=
dbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.com/go=
frs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/gofrs/uui=
d github.com/gogo/googleapis:github.com/gogo/googleapis github.com/gogo/pro=
tobuf:github.com/gogo/protobuf github.com/golang/freetype:github.com/golang=
/freetype github.com/golang/glog:github.com/golang/glog github.com/golang/g=
roupcache:github.com/golang/groupcache github.com/golang/mock:github.com/go=
lang/mock github.com/golang/protobuf:github.com/golang/protobuf github.com/=
golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:github.c=
om/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus/fmt git=
hub.com/golangplus/testing:github.com/golangplus/testing github.com/google/=
btree:github.com/google/btree github.com/google/cadvisor:github.com/google/=
cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.com/googl=
e/go-containerregistry:github.com/google/go-containerregistry github.com/go=
ogle/gofuzz:github.com/google/gofuzz github.com/google/martian:github.com/g=
oogle/martian github.com/google/martian/v3:github.com/google/martian/v3 git=
hub.com/google/pprof:github.com/google/pprof github.com/google/renameio:git=
hub.com/google/renameio github.com/google/shlex:github.com/google/shlex git=
hub.com/google/uuid:github.com/google/uuid github.com/googleapis/gax-go/v2:=
github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:github.co=
m/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/gophercl=
oud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/gopherjs g=
ithub.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/websocket:g=
ithub.com/gorilla/websocket github.com/gregjones/httpcache:github.com/gregj=
ones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.com/grpc=
-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-prometheus:=
github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosystem/grpc=
-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/go-fuse/v=
2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:github.com/h=
ashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com/hashico=
rp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicorp/errwra=
p github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp githu=
b.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/hashicorp=
/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.com/hash=
icorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashicorp/go-mu=
ltierror:github.com/hashicorp/go-multierror github.com/hashicorp/go-retryab=
lehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/go-rootce=
rts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-sockaddr:gith=
ub.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.com/hash=
icorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/go-uuid g=
ithub.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/hashicorp=
/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hcl:github=
.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashicorp/logut=
ils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/hashicor=
p/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/serf:gith=
ub.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/heketi git=
hub.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tail:github=
.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelgupf/sock=
etpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor/demangl=
e github.com/imdario/mergo:github.com/imdario/mergo github.com/inconshrevea=
ble/mousetrap:github.com/inconshreveable/mousetrap github.com/insomniacslk/=
dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:github.com/i=
shidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping github.c=
om/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespath/go-jm=
espath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmespath/inte=
rnal/testify:github.com/jmespath/go-jmespath/internal/testify//internal/tes=
tify github.com/joho/godotenv:github.com/joho/godotenv github.com/jonboulle=
/clockwork:github.com/jonboulle/clockwork github.com/josharian/intern:githu=
b.com/josharian/intern github.com/josharian/native:github.com/josharian/nat=
ive github.com/jpillora/backoff:github.com/jpillora/backoff github.com/jsim=
onetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-iterator/g=
o:github.com/json-iterator/go github.com/jstemmer/go-junit-report:github.co=
m/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/gls gith=
ub.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter github.=
com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/critbitg=
o:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:github.com/=
k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kine github=
.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisielk/errc=
heck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.com/kisie=
lk/gotool github.com/klauspost/compress:github.com/klauspost/compress githu=
b.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsorten/go-wi=
ndows-terminal-sequences:github.com/konsorten/go-windows-terminal-sequences=
 github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/kr/logfm=
t github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:github.com/kr=
/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-sigs/cri-t=
ools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/godebug:git=
hub.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq github.com/l=
ibopenstorage/openstorage:github.com/libopenstorage/openstorage github.com/=
liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer/dedent:=
github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpabon/godbc=
 github.com/magiconair/properties:github.com/magiconair/properties github.c=
om/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-colorable=
:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.com/mattn/=
go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewidth githu=
b.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com/mattn/g=
o-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_protobuf=
_extensions:github.com/matttproud/golang_protobuf_extensions github.com/mdl=
ayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/ethtool:git=
hub.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/mdlayher/=
genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink github.co=
m/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:github.co=
m/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.com/miek=
g/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.com/mikioh=
/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml github.co=
m/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-go/v7:git=
hub.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/minio/sha=
256-simd github.com/minio/sio:github.com/minio/sio github.com/mistifyio/go-=
zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com/mitchel=
lh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir gith=
ub.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testing-inter=
face github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordwrap gith=
ub.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/iochan:g=
ithub.com/mitchellh/iochan github.com/mitchellh/mapstructure:github.com/mit=
chellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs github.com/mo=
by/locker:github.com/moby/locker github.com/moby/spdystream:github.com/moby=
/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo//mo=
untinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//symlink =
github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:github.com=
/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/concurren=
t github.com/modern-go/reflect2:github.com/modern-go/reflect2 github.com/mo=
hae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go-gitigno=
re:github.com/monochromegane/go-gitignore github.com/morikuni/aec:github.co=
m/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fileutils gi=
thub.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/mvdan/xu=
rls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.com/mwitk=
ow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowrate githu=
b.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.com/nieme=
yer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.com/nxad=
m/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/olekukonko/ta=
blewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:github.c=
om/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github.com/ope=
ncontainers/go-digest:github.com/opencontainers/go-digest github.com/openco=
ntainers/image-spec:github.com/opencontainers/image-spec github.com/opencon=
tainers/runc:github.com/opencontainers/runc github.com/opencontainers/runti=
me-spec:github.com/opencontainers/runtime-spec github.com/opencontainers/se=
linux:github.com/opencontainers/selinux github.com/opentracing/opentracing-=
go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:github.com/o=
srg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.com/otiai1=
0/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/otiai10/m=
int github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.com/paul=
mach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com/pborman=
/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-buffruneio=
 github.com/pelletier/go-toml:github.com/pelletier/go-toml github.com/peter=
bourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:github.c=
om/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.com/pkg/s=
ftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pmezard/go=
-difflib github.com/posener/complete:github.com/posener/complete github.com=
/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/prometheus=
/client_golang:github.com/prometheus/client_golang github.com/prometheus/cl=
ient_model:github.com/prometheus/client_model github.com/prometheus/common:=
github.com/prometheus/common github.com/prometheus/procfs:github.com/promet=
heus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb github.co=
m/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:github.co=
m/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher/dynamic=
listener github.com/rancher/lasso:github.com/rancher/lasso github.com/ranch=
er/remotedialer:github.com/rancher/remotedialer github.com/rancher/wharfie:=
github.com/rancher/wharfie github.com/rancher/wrangler:github.com/rancher/w=
rangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/bigfft g=
ithub.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpeppe/fast=
uuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:github.co=
m/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:github.co=
m/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/xid githu=
b.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/blackfri=
day:github.com/russross/blackfriday github.com/russross/blackfriday/v2:gith=
ub.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github.com/rya=
nuber/columnize github.com/safchain/ethtool:github.com/safchain/ethtool git=
hub.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/seed:gith=
ub.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/seccomp/l=
ibseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff github.c=
om/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_anchor_name=
 github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/smartystr=
eets/assertions:github.com/smartystreets/assertions github.com/smartystreet=
s/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cmux:githu=
b.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/water githu=
b.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf13/afero=
:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast github.=
com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweatherman:g=
ithub.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com/spf13/p=
flag github.com/spf13/viper:github.com/spf13/viper github.com/stefanberger/=
go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewer/go-str=
case:github.com/stoewer/go-strcase github.com/storageos/go-api:github.com/s=
torageos/go-api github.com/stretchr/objx:github.com/stretchr/objx github.co=
m/stretchr/testify:github.com/stretchr/testify github.com/subosito/gotenv:g=
ithub.com/subosito/gotenv github.com/syndtr/gocapability:github.com/syndtr/=
gocapability github.com/tchap/go-patricia:github.com/tchap/go-patricia gith=
ub.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/tencentclou=
d-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github.com/tmc=
/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.com/u-root=
/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ugorji/go =
github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v2:github=
.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negroni gith=
ub.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vektah/gqlpa=
rser:github.com/vektah/gqlparser github.com/vishvananda/netlink:github.com/=
vishvananda/netlink github.com/vishvananda/netns:github.com/vishvananda/net=
ns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/willf/bit=
set:github.com/willf/bitset github.com/xiang90/probing:github.com/xiang90/p=
robing github.com/xlab/treeprint:github.com/xlab/treeprint github.com/xorda=
taexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/goldmark:=
github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.io/etcd:=
go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/clien=
t/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/etcd/clie=
nt/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/client/pkg/=
v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/v3//raft=
 go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.io/etcd/=
client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/etcdutl/=
v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3:github.=
com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/pkcs7 go=
.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.opentelemetr=
y.io/contrib go.opentelemetry.io/contrib/instrumentation/google.golang.org/=
grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.golang.or=
g/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/http/otelht=
tp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp go.opente=
lemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/exporters=
/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/otel/met=
ric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/oteltest:go.o=
pentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.opentelemetr=
y.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.opentelemetry.=
io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.opentelem=
etry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opentelemetry.io=
/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemetry/opent=
elemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/starlark-go =
go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.org/goleak=
 go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.org/zap =
golang.org/x/crypto:github.com/golang/crypto golang.org/x/exp:github.com/go=
lang/exp golang.org/x/image:github.com/golang/image golang.org/x/lint:githu=
b.com/golang/lint golang.org/x/mobile:github.com/golang/mobile golang.org/x=
/mod:github.com/golang/mod golang.org/x/net:github.com/golang/net golang.or=
g/x/oauth2:github.com/golang/oauth2 golang.org/x/sync:github.com/golang/syn=
c golang.org/x/sys:github.com/golang/sys golang.org/x/term:github.com/golan=
g/term golang.org/x/text:github.com/golang/text golang.org/x/time:github.co=
m/golang/time golang.org/x/tools:github.com/golang/tools golang.org/x/xerro=
rs:github.com/golang/xerrors golang.zx2c4.com/go118/netip:golang.zx2c4.com/=
go118/netip golang.zx2c4.com/wintun:golang.zx2c4.com/wintun golang.zx2c4.co=
m/wireguard:golang.zx2c4.com/wireguard golang.zx2c4.com/wireguard/wgctrl:go=
lang.zx2c4.com/wireguard/wgctrl gonum.org/v1/gonum:github.com/gonum/gonum g=
onum.org/v1/netlib:github.com/gonum/netlib gonum.org/v1/plot:github.com/gon=
um/plot google.golang.org/api:google.golang.org/api google.golang.org/appen=
gine:google.golang.org/appengine google.golang.org/genproto:google.golang.o=
rg/genproto google.golang.org/grpc:google.golang.org/grpc google.golang.org=
/grpc/cmd/protoc-gen-go-grpc:google.golang.org/grpc/cmd/protoc-gen-go-grpc =
google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/airbrake/gob=
rake.v2:gopkg.in/airbrake/gobrake.v2 gopkg.in/alecthomas/kingpin.v2:gopkg.i=
n/alecthomas/kingpin.v2 gopkg.in/check.v1:gopkg.in/check.v1 gopkg.in/chegga=
aa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in/errgo.v2:gopkg.in/errgo.v2 gopkg.=
in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg.in/gcfg.v1:gopkg.in/gcfg.v1 gopkg=
.in/gemnasium/logrus-airbrake-hook.v2:gopkg.in/gemnasium/logrus-airbrake-ho=
ok.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gopkg.in/ini.v1:gopkg.in/ini.v1 gopkg=
.in/natefinch/lumberjack.v2:gopkg.in/natefinch/lumberjack.v2 gopkg.in/resty=
.v1:gopkg.in/resty.v1 gopkg.in/square/go-jose.v2:gopkg.in/square/go-jose.v2=
 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.in/warnings.v0:gopkg.in/warnings.v=
0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg.in/yaml.v3:gopkg.in/yaml.v3 gotes=
t.tools:gotest.tools gotest.tools/v3:github.com/gotestyourself/gotest.tools=
/v3 honnef.co/go/tools:honnef.co/go/tools inet.af/tcpproxy:inet.af/tcpproxy=
 k8s.io/api:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/sr=
c/k8s.io/api k8s.io/apiextensions-apiserver:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/apiextensions-apiserver k8s.io/api=
machinery:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/=
k8s.io/apimachinery k8s.io/apiserver:github.com/k3s-io/kubernetes/staging/s=
rc/k8s.io/api//staging/src/k8s.io/apiserver k8s.io/cli-runtime:github.com/k=
3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cli-runtime k8s=
.io/client-go:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/=
src/k8s.io/client-go k8s.io/cloud-provider:github.com/k3s-io/kubernetes/sta=
ging/src/k8s.io/api//staging/src/k8s.io/cloud-provider k8s.io/cluster-boots=
trap:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/cluster-bootstrap k8s.io/code-generator:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/code-generator k8s.io/component-base=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/co=
mponent-base k8s.io/component-helpers:github.com/k3s-io/kubernetes/staging/=
src/k8s.io/api//staging/src/k8s.io/component-helpers k8s.io/controller-mana=
ger:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io=
/controller-manager k8s.io/cri-api:github.com/k3s-io/kubernetes/staging/src=
/k8s.io/api//staging/src/k8s.io/cri-api k8s.io/csi-translation-lib:github.c=
om/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/csi-transla=
tion-lib k8s.io/kube-aggregator:github.com/k3s-io/kubernetes/staging/src/k8=
s.io/api//staging/src/k8s.io/kube-aggregator k8s.io/kube-controller-manager=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/ku=
be-controller-manager k8s.io/kube-proxy:github.com/k3s-io/kubernetes/stagin=
g/src/k8s.io/api//staging/src/k8s.io/kube-proxy k8s.io/kube-scheduler:githu=
b.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-sch=
eduler k8s.io/kubectl:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//=
staging/src/k8s.io/kubectl k8s.io/kubelet:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/kubelet k8s.io/kubernetes:github.com=
/k3s-io/kubernetes/staging/src/k8s.io/api k8s.io/legacy-cloud-providers:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/legacy=
-cloud-providers k8s.io/metrics:github.com/k3s-io/kubernetes/staging/src/k8=
s.io/api//staging/src/k8s.io/metrics k8s.io/mount-utils:github.com/k3s-io/k=
ubernetes/staging/src/k8s.io/api//staging/src/k8s.io/mount-utils k8s.io/pod=
-security-admission:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//st=
aging/src/k8s.io/pod-security-admission k8s.io/sample-apiserver:github.com/=
k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/sample-apiserv=
er k8s.io/gengo:k8s.io/gengo k8s.io/klog:k8s.io/klog k8s.io/klog/v2:github.=
com/k3s-io/klog/v2 k8s.io/kube-openapi:k8s.io/kube-openapi k8s.io/system-va=
lidators:k8s.io/system-validators k8s.io/utils:k8s.io/utils modernc.org/cc:=
modernc.org/cc modernc.org/golex:modernc.org/golex modernc.org/mathutil:mod=
ernc.org/mathutil modernc.org/strutil:modernc.org/strutil modernc.org/xc:mo=
dernc.org/xc rsc.io/binaryregexp:rsc.io/binaryregexp rsc.io/pdf:rsc.io/pdf =
rsc.io/quote/v3:github.com/rsc/quote/v3//v3 rsc.io/sampler:rsc.io/sampler s=
igs.k8s.io/apiserver-network-proxy/konnectivity-client:github.com/kubernete=
s-sigs/apiserver-network-proxy/konnectivity-client//konnectivity-client sig=
s.k8s.io/cli-utils:sigs.k8s.io/cli-utils sigs.k8s.io/controller-runtime:sig=
s.k8s.io/controller-runtime sigs.k8s.io/kustomize/api:github.com/kubernetes=
-sigs/kustomize/api//api sigs.k8s.io/kustomize/cmd/config:github.com/kubern=
etes-sigs/kustomize/api//cmd/config sigs.k8s.io/kustomize/kustomize/v4:gith=
ub.com/kubernetes-sigs/kustomize/api//kustomize sigs.k8s.io/kustomize/kyaml=
:github.com/kubernetes-sigs/kustomize/api//kyaml sigs.k8s.io/structured-mer=
ge-diff/v4:github.com/kubernetes-sigs/structured-merge-diff/v4 sigs.k8s.io/=
testing_frameworks:sigs.k8s.io/testing_frameworks sigs.k8s.io/yaml:sigs.k8s=
.io/yaml sigs.k8s.io/json:sigs.k8s.io/json"
         for s in $sites; do
             site_dest=3D$(echo $s | cut -d: -f1)
             site_source=3D$(echo $s | cut -d: -f2)
--=20
2.35.1


