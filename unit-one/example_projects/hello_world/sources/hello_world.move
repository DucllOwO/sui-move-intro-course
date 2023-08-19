// Copyright (c) 2022, Sui Foundation
// SPDX-License-Identifier: Apache-2.0

/// A basic Hello World example for Sui Move, part of the Sui Move intro course:
/// https://github.com/sui-foundation/sui-move-intro-course
/// 
/// 

module hello_world::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    // transaction object give information about current tx that we currently we executed
    use sui::tx_context::{Self, TxContext};

    /// An object that contains an arbitrary string
    struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    public entry fun mint(ctx: &mut TxContext) {
        //created obj
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        // transper the obj to the sender (the person call this method in transaction)
        transfer::public_transfer(object, tx_context::sender(ctx));
    }

}