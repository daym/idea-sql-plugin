package com.github.daym.ideasqlplugin.stubs.types

import com.github.daym.ideasqlplugin.SqlLanguage
import com.github.daym.ideasqlplugin.stubs.SqlFileStub
import com.intellij.psi.stubs.StubElement
import com.intellij.psi.stubs.StubInputStream
import com.intellij.psi.stubs.StubOutputStream
import com.intellij.psi.tree.IStubFileElementType
import org.jetbrains.annotations.NonNls

class SqlFileElementType(language: SqlLanguage?) : IStubFileElementType<SqlFileStub>(language) {
    override fun getStubVersion(): Int = VERSION

    override fun serialize(stub: SqlFileStub, dataStream: StubOutputStream) = Unit

    override fun deserialize(dataStream: StubInputStream, parentStub: StubElement<*>?): SqlFileStub =
        SqlFileStub(null)

    @NonNls
    override fun getExternalId(): String = super.getExternalId() + ".FILE"

    companion object {
        @JvmField
        val INSTANCE = SqlFileElementType(SqlLanguage.INSTANCE)

        private const val VERSION = 3 // Change the version if you want to re-index
    }
}
